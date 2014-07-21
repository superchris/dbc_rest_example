require 'mechanize'
require 'octokit'

@phase_guide = "https://github.com/salamanders-2014/phase-2-guide/blob/master/week-3.md"
@from_cohort = "coyotes-2014"
@to_cohort = "salamanders-2014"

mech = Mechanize.new
puts "Logging into github..."
login_page = mech.get "http://github.com/login"
login_form = login_page.forms.detect { |f| f.action == "/session" }
login_form.login = ARGV[0]
login_form.password = ARGV[1]
login_form.submit

puts "Retrieving phase guide..."
phase_guide_page = mech.get @phase_guide
challenge_links = phase_guide_page.links.select { |link| link.href =~ /^\/.*?challenge$/ }

@client = Octokit::Client.new(login: ARGV[0], password: ARGV[1])

@students = @client.organization_teams(@to_cohort).detect { |t| t.name == "students"}

def fork(repo)
  puts "Forking #{repo} from #{@from_cohort} to #{@to_cohort}"
  new_repo = @client.fork("#{@from_cohort}/#{repo}", organization: @to_cohort)
  @client.add_team_repository(@students.id, new_repo.full_name)
end

puts "Hardcore forking action commencing."
challenge_links.each { |link| fork(link.href.split("/").last) }
