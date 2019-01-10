class RecordingsController < ApplicationController
  def index
    prepare()
    # get all recordings
    @result = @api.get_recordings()
  end
end
