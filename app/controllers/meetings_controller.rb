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
    @meeting = Meeting.find(params[:id])
  end

  def index
    @meetings = Meeting.all
  end

  def edit
    @meeting = Meeting.find(params[:id])
    @id = params[:id].to_s
    @pass = @meeting.modPW.to_s
    prepare()
    @api.end_meeting(@id, @pass)

    @meeting.destroy
  end

  private def create_meeting(name, id, modPW, attPW)
    prepare()
    @id = id
    @name = name
    @options = {
      :attendeePW=> attPW,
      :moderatorPW => modPW,
      :welcome => "Welcome to the #{(name)} meeting!"
    }
    if @api.is_meeting_running?(@id)
      puts "The meeting is already running"
    else
      response = @api.create_meeting(@name, @id, @options)
      puts "The meeting has been created"
    end
  end
end
