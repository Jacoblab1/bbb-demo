require 'bigbluebutton_api'

class ApplicationController < ActionController::Base
  # setup api connection with BBB server
  def prepare
    url = (ENV['BIGBLUEBUTTON_ENDPOINT'] || 'http://test-install.blindsidenetworks.com/bigbluebutton/') + 'api'
    secret = ENV['BIGBLUEBUTTON_SECRET'] || '8cd8ef52e8e101574e400365b55e11a6'
    version = 0.81

    @api = BigBlueButton::BigBlueButtonApi.new(url, secret, version.to_s, true)
  end

  # gets meetings from BBB server
  def get_meetings
    prepare()
    @api.get_meetings()
  end

  def create_meeting(name, id, modPW, attPW, recording)
    # create a meeting on the BBB server
    prepare()
    do_record = int_to_boolean(recording)
    @options = {
      :attendeePW=> attPW,
      :moderatorPW => modPW,
      :welcome => "Welcome to the #{(name)} meeting!",
      :record => do_record
    }
    if meeting_running?(id)
      puts "The meeting is already running"
    else
      response = make_meeting(name, id, @options)
      puts "The meeting has been created"
    end
  end

  # converts an integer to a true/false value
  def int_to_boolean(integer)
    if integer.to_i == 1
      return true
    else
      return false
    end
  end

  # checks if meeting with specified id is running
  def meeting_running?(id)
    prepare()
    @api.is_meeting_running?(id)
  end

  # creates an ID with specified parameters
  def make_meeting(name, id, options)
    prepare()
    @api.create_meeting(name, id, options)
  end
end
