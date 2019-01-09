require 'bigbluebutton_api'

class ConnectController < ApplicationController
  def join
    prepare()
    if check_valid()
      url = @api.join_meeting_url(params[:id], params[:username], params[:password])
      redirect_to "#{url}"
    else
      puts "Error joining meeting"
    end
  end

  # this function is not complete
  private def check_valid
    @meeting = Meeting.find(params[:id])
    if @meeting == nil
      # meeting doesn't exist in local db (may still exist on server, but this app doesn't check that)
      return false
    elsif @meeting.modPW == params[:password] || @meeting.attPW == params[:password]
      # password is good
      return true
    else
      # password was bad
      return false
    end
  end
end
