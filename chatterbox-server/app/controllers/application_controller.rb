class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/messages" do
    messages = Message.all.order(:created_at)
    messages.to_json
  end

  post "/messages" do
    new_message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    new_message.to_json
  end

  patch "/messages/:id" do
    updated_message = Message.find(params[:id])
    updated_message.update(
      body: params[:body]
    )
    updated_message.to_json
  end

  delete "/messages/:id" do
    message_to_delete = Message.find(params[:id])
    message_to_delete.destroy
    message_to_delete.to_json
  end

end
