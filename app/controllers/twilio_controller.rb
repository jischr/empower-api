require 'twilio-ruby'

class TwilioController < ApplicationController
  skip_before_action :authenticate_request

  def call
    begin
      account_sid = "AC592875f15c8aa07728f754d8efd086e1" # Your Account SID from www.twilio.com/console
      auth_token = "232fb9afaf465642c0079920bfebbc3e"   # Your Auth Token from www.twilio.com/console

      @client = Twilio::REST::Client.new account_sid, auth_token
      @message = "Hi #{params[:user_name]}. Please take your GAD-7 Survey. http://google.com"
      message = @client.account.messages.create(:body => @message,
      :to => params[:phone_number],    # Replace with your phone number
      :from => "+17209438130")  # Replace with your Twilio number
      render json: {  success: 'Success: The reminder SMS has been sent.' }
      puts message
    rescue Twilio::REST::RequestError => e
      puts e.message
      render json: { error: 'Problem occured: Please try again later.' }
    end
  end
end
