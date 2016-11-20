require_relative "spec_helper"
require_relative "../twitter_histo.rb"

def app
  TwitterHisto
end

describe TwitterHisto do
  it "responds with a welcome message" do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end
