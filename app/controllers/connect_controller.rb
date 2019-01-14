require 'bigbluebutton_api'

class ConnectController < ApplicationController

  def index
    session[:username] = "Guest"
  end

  # Join a meeting on the BBB server
  def join
    if check_valid()
      url = get_meeting_url()
      redirect_to "#{url}"
    else
      redirect_to root_path
      puts 'DEBUG: Problem joining meeting'
    end
  end

  # check if valid meeting ID/password
  def check_valid
    if params[:password] == "" || params[:username] == "" || params[:id] == ""
      flash[:missing] = true
      return false
    end
    @meetings = get_meetings()
    @meetings[:meetings].each do |m|
       if m[:meetingID] == params[:id]
          if m[:moderatorPW] == params[:password] || m[:attendeePW] == params[:password]
            return true
          end
       end
    end
    flash[:error] = true
    return false
  end

  # get join meeting url
  def get_meeting_url
    prepare()
    @api.join_meeting_url(params[:id], params[:username], params[:password])
  end
end
