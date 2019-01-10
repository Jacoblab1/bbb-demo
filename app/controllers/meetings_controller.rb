require 'bigbluebutton_api'

class MeetingsController < ApplicationController
  def create
    @meeting = Meeting.create(meeting_params) # create in database
    create_meeting(meeting_params[:name], meeting_params[:id], meeting_params[:modPW], meeting_params[:attPW]) # create on bbb server
    @meeting.save
    redirect_to @meeting
  end

  private def meeting_params
    params.require(:meeting).permit(:name, :id, :modPW, :attPW)
  end

  def show
    # get meeting with specified id
    @meeting = Meeting.find(params[:id])
  end

  def index
    # get all meetings
    @meetings = Meeting.all
  end

  def edit
    # end a meeting on server, and then delete it from database
    @meeting = Meeting.find(params[:id])
    @id = params[:id].to_s
    @pass = @meeting.modPW.to_s
    prepare()
    @api.end_meeting(@id, @pass)

    @meeting.destroy
  end
end
