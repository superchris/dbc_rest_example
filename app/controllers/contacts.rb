get "/contacts" do
  @contacts = Contact.all
  if request.xhr?
    content_type :json
    @contacts.to_json
  else
    erb :"contacts/index"
  end
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
  if request.xhr?
    content_type :json
    {foo: "bar"}.to_json
  else
    redirect to("/contacts/#{@contact.id}")
  end
end

get "/contacts/:id/edit" do
  @contact = Contact.find(params[:id])

  erb :"contacts/edit"
end

put "/contacts/:id" do
  @contact = Contact.find(params[:id])

  @contact.update(params[:contact])

  redirect to("/contacts/#{@contact.id}")
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id])

  @contact.destroy

  redirect to('/contacts')
end
