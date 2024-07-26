require 'shoryuken'

class MessageWorker
  include Shoryuken::Worker

  shoryuken_options queue: 'MyQueue', auto_delete: false

  def perform(sqs_msg, body)
    puts "Received message: #{body}"
    sleep 10
    puts "Processing message: #{body}"
  end
end