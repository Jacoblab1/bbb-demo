class RecordingsController < ApplicationController
  def index
    # get all recordings
    @result = get_recordings()
  end

  def get_recordings
    prepare()
    @api.get_recordings()
  end
end
