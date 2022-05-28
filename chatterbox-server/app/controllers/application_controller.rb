class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/messages' do
    Message.order(:created_at).to_json
  end

  post '/messages' do
    Message.create(body: params[:body],
                   username: params[:username]
                  ).to_json
  end

  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(body: params[:body])
    message.to_json
  end

  delete '/messages/:id' do
    Message.find(params[:id]).delete.to_json
  end
end
