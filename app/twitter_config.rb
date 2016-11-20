require 'json'

class TwitterConfig
	
	attr_accessor :key, :consumer_secret, :token, :token_secret

	def initialize(config_path)
		file = File.read(config_path)
		data = JSON.parse(file)
		@key = data['key']
		@token = data['token']
		@consumer_secret = data['consumer_secret']
		@token_secret = data['token_secret']
	end

end