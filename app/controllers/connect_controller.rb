require 'bigbluebutton_api'

class ConnectController < ApplicationController

  def index
    @error = flash[:error]
  end

  def join
    prepare()
    if check_valid()
      session[:error] = false
      url = @api.join_meeting_url(params[:id], params[:username], params[:password])
      redirect_to "#{url}"
    else
      flash[:error] = true
      redirect_to root_path
      puts 'DEBUG: Problem joining meeting'
    end
  end

  # this function is not complete
  private def check_valid

    if Meeting.exists?(params[:id])
      @meeting = Meeting.find(params[:id])
      if @meeting.modPW == params[:password] || @meeting.attPW == params[:password]
        return true
      else
        return false
      end
    else
      return false
    end
  end
end
