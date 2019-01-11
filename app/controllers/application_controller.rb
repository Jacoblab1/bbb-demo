require 'bigbluebutton_api'

class ApplicationController < ActionController::Base
  # setup api connection with BBB server
  def prepare
    url = (ENV['BIGBLUEBUTTON_ENDPOINT'] || 'http://test-install.blindsidenetworks.com/bigbluebutton/') + 'api'
    secret = ENV['BIGBLUEBUTTON_SECRET'] || '8cd8ef52e8e101574e400365b55e11a6'
    version = 0.81

    @api = BigBlueButton::BigBlueButtonApi.new(url, secret, version.to_s, true)
  end

  def get_meetings
    prepare()
    @api.get_meetings()
  end

  def create_meeting(name, id, modPW, attPW, recording)
    # create a meeting on the BBB server
    prepare()
    do_record = int_to_boolean(recording)

    @id = id
    @name = name
    @options = {
      :attendeePW=> attPW,
      :moderatorPW => modPW,
      :welcome => "Welcome to the #{(name)} meeting!",
      :record => do_record
    }
    if @api.is_meeting_running?(@id)
      puts "The meeting is already running"
    else
      response = @api.create_meeting(@name, @id, @options)
      puts "The meeting has been created"
    end
  end

  def int_to_boolean(integer)
    if recording.to_i == 1
      return true
    else
      return false
    end
  end
end
