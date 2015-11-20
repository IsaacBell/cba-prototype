require "spec_helper"

=begin
Test four basic functions for mailers:
1. Is it actually sending the email
2. Is the email being sent to the desired recipient
3. Is the subject line of the email correct
4. Is the email being sent from the correct address
=end

describe "contact_mailer" do
  before(:each) do
    # Configure mailer for test delivery
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []

    # App with correct parameters passed in
    @message = Message.new
    @message.name = "Test Message"
    @message.email = "test@gmail.com"
    @message.body = "Test message content"

    # Mail out an application in the test environment
    RequestInfoMailer.new_message(@message, 'isaac@nine.is').deliver
  end

  after(:each) do
    # Clear the array of sent emails before the next test is run
    ActionMailer::Base.deliveries.clear
  end

  it 'should send an email' do
    ActionMailer::Base.deliveries.count.should == 1
  end

  it 'renders the receiver email' do
    ActionMailer::Base.deliveries.first.to.should == ["isaac@nine.is"]
  end

  it 'should set the subject to the correct subject' do
    ActionMailer::Base.deliveries.first.subject.should == 'New Message From Your Portfolio Website'
  end

  it 'renders the correct sender email' do  
    ActionMailer::Base.deliveries.first.from.should == ['portfolio.mailer@gmail.com']
  end
end