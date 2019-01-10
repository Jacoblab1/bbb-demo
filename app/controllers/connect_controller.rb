require 'bigbluebutton_api'

class ConnectController < ApplicationController

  def index
    @error = flash[:error]
    @missing = flash[:missing]
    @name = session[:username]
  end

  def join
    prepare()
    if check_valid()
      session[:error] = false
      meeting = Meeting.find(params[:id])
      create_meeting(meeting[:name], meeting[:id], meeting[:modPW], meeting[:attPW], meeting[:recording]) # create on bbb server
      url = @api.join_meeting_url(meeting[:id], params[:username], params[:password])
      redirect_to "#{url}"
    else
      redirect_to root_path
      puts 'DEBUG: Problem joining meeting'
    end
  end

  # check if valid meeting ID/password
  private def check_valid
    if params[:password] == "" || params[:username] == "" || params[:id] == ""
      flash[:missing] = true
      return false
    end
    @meetings = @api.get_meetings()
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
end
