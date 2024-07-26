require 'sinatra'
require 'aws-sdk-sqs'
require 'shoryuken'
require 'json'

class App < Sinatra::Base
  get '/' do
    send_file 'public/index.html'
  end

  post '/send' do
    message = params[:message]

    # Send message to SQS queue
    sqs = Aws::SQS::Client.new(region: 'us-east-1')
    queue_url = sqs.get_queue_url(queue_name: 'MyQueue').queue_url
    response = sqs.send_message(queue_url: queue_url, message_body: message)


    content_type :json
    {
      message: 'Message sent to SQS!',
      message_id: response.message_id,
      message_body: message,
      queue_url: queue_url
    }.to_json
  end

  run! if app_file == $0
end
