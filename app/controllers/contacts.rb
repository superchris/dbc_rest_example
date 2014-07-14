get "/contacts" do
  @contacts = Contact.all
  erb :"contacts/index"
end

get "/contacts/new" do
  @contact = Contact.new
  erb :"contacts/new"
end

get "/contacts/:id" do
  @contact = Contact.find(params[:id])
  erb :"contacts/show"
end

post "/contacts" do
  @contact = Contact.create(params[:contact])
  erb :"contacts/show"
end
