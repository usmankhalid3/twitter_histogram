require 'json'
require_relative "spec_helper"
require_relative "../app/twitter_histogram.rb"

def app
  TwitterHistogram
end

describe TwitterHistogram do

  it "responds with a default message" do
    get '/'

	# validate 200 status code
    assert last_response.ok?

    # validate response is correct
    assert last_response.body.include?('Try /hello/:name')
  end

  it "responds with a greeting" do
    get '/hello/barrackObama'

	# validate 200 status code
    assert last_response.ok?

    # validate response is correct
    assert last_response.body.include?('Hello, barrackObama')

  end

  it "responds with a histogram" do
  	get '/histogram/usmankhalid'

  	response = 

  	hash = JSON[last_response.body]
  	tweets_by_hour = hash["tweets_by_hour"]

  	most_active_during = tweets_by_hour.max_by{|k,v| v}.first

  	hours = tweets_by_hour.keys.map{|key|
  		meridian_time = key.split('-').first
  		non_meridian  = Time.parse(meridian_time).strftime("%-H").to_i
  	}

  	# validate 200 status code
	assert last_response.ok?

	# validate response structure
	assert_equal hash.keys, ["tweets_by_hour", "most_active_during"]

	# validate total hours
  	assert_equal 24, tweets_by_hour.count

  	# validate distinct hours
  	assert_equal (0..23).to_a, hours

  	# validate most active duration
  	assert_equal most_active_during, hash["most_active_during"]

  end
end
