require 'spec_helper'
require "twitter"

# https://apps.twitter.com/
# Needs to be configured

describe "twitter" do
	it "can fetch its home timeline" do
    twitter_client.home_timeline
  end

  it "can fetch a cursored list of friends" do
    twitter_client.friends.take(10)
  end

  it "can stream tweets for the user" do
    twitter_streaming_client.user do |object|
      puts object.text if object.is_a? Twitter::Tweet
    end
  end
end