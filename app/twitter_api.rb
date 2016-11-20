require 'twitter'
require 'json'
require_relative 'histogram'

class TwitterApi

	def initialize(config)
		@client = Twitter::REST::Client.new do |twitter_config|
		  twitter_config.consumer_key        = config.key
		  twitter_config.consumer_secret     = config.consumer_secret
		  twitter_config.access_token        = config.token
		  twitter_config.access_token_secret = config.token_secret
		end
	end

	def tweet_counts_by_hour(screen_name)
		histo = Histogram.new
		get_all_tweets(screen_name).each do |tweet|
			histo.add(tweet.created_at)
		end

		histo
	end

	def collect_with_max_id(collection=[], max_id=nil, &block)
	  response = yield(max_id)
	  collection += response
	  response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
	end

	def get_all_tweets(screen_name)
	  collect_with_max_id do |max_id|
	    options = {:screen_name => "#{screen_name}", :count => 100}
	    options[:max_id] = max_id unless max_id.nil?
	    @client.user_timeline(options)
	  end
	end

end