require 'bigbluebutton_api'

class MeetingsController < ApplicationController
  def create
    create_meeting(meeting_params[:name], meeting_params[:id], meeting_params[:modPW], meeting_params[:attPW], meeting_params[:recording]) # create on bbb server
    redirect_to meetings_path
  end

  private def meeting_params
    params.require(:meeting).permit(:name, :id, :modPW, :attPW, :recording)
  end

  def index
    # get all meetings
    prepare()
    @meetings = @api.get_meetings()
  end
end
