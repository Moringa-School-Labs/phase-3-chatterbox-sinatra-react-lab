class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/messages' do
    all_messages = Message.all.order(:created_at)
    all_messages.to_json
  end

  post '/messages' do
    new_message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    new_message.to_json
  end

  patch '/messages/:id' do
    updated_msg = Message.find(params[:id])
    updated_msg.update(
      body: params[:body]
    )
    updated_msg.to_json
  end

  delete '/messages/:id' do
    deleted_msg = Message.find(params[:id])
    deleted_msg.destroy
    deleted_msg.to_json
  end
  

end
