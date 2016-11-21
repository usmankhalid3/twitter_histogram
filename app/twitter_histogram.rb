require 'sinatra'
require 'json'
require 'date'

require_relative 'twitter_config'
require_relative 'twitter_api'

class TwitterHistogram < Sinatra::Base

  set :public_folder => "public", :static => true

  get '/' do
    'Try /hello/:name'
  end

  get '/hello/:name' do
    @greeting_name = params[:name]
    "Hello, #{@greeting_name}"
  end

  get '/histogram/:user' do
    content_type :json
  	name = params[:user]
  	config = TwitterConfig.new 'config/twitter_config.json'
  	api = TwitterApi.new(config)
  	histo = api.tweet_counts_by_hour(name)
  	{
  		:tweets_by_hour => histo.counts_by_hour,
  		:most_active_during => histo.most_active_during
  	}.to_json

  end

end