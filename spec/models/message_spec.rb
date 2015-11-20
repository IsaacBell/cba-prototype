require 'spec_helper'
require "message"

describe "message" do
	before do
		@message = Message.new
	    @message.name = "Test Message"
	    @message.email = "test@gmail.com"
	    @message.body = "Test message content"
	end

	it "is invalid if body is empty" do
		@message.body = ""
		@message.should be_invalid
	end

	it "is valid if correct parameters are provided" do
		@message.should be_valid
	end
end