require 'bigbluebutton_api'

class ConnectController < ApplicationController
  def join
    prepare()
    url = @api.join_meeting_url(params[:id], params[:username], params[:password])
    redirect_to "#{url}"
  end
end
