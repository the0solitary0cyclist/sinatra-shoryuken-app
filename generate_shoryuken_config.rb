require 'dotenv'
require 'yaml'

Dotenv.load

shoryuken_config = {
  'aws' => {
    'access_key_id' => ENV['AWS_ACCESS_KEY_ID'],
    'secret_access_key' => ENV['AWS_SECRET_ACCESS_KEY'],
    'region' => ENV['AWS_REGION']
  },
  'queues' => [
    ENV['QUEUE_NAME']
  ]
}

File.open('shoryuken.yml', 'w') do |file|
  file.write(shoryuken_config.to_yaml)
end

puts 'shoryuken.yml has been generated'
