get "/contacts" do
  @contacts = Contact.all
  erb :"contacts/index"
end
