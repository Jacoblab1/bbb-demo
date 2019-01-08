require 'bigbluebutton_api'

class ConnectController < ApplicationController
  private def prepare
    url = "http://10.253.174.144/bigbluebutton/api"
    secret = "5c0bac3a78aab43ef22dc75e89312a5a"
    version = 0.81

    @api = BigBlueButton::BigBlueButtonApi.new(url, secret, version.to_s, true)
  end

  private def create_demo_meeting
    @name = "Demo Meeting"
    @id = "demomeeting2"
    @options = {
      :attendeePW=> "mp",
      :moderatorPW => "ap",
      :welcome => "Welcome to the demo meeting!"
    }
    if @api.is_meeting_running?(@id)
      puts "The meeting is already running"
    else
      response = @api.create_meeting(@name, @id, @options)
      puts "The meeting has been created"
    end
  end

  def join
    prepare()
    create_demo_meeting()
    url = @api.join_meeting_url(@id, params[:name], @options[:attendeePW])
    redirect_to "#{url}"
  end

end
