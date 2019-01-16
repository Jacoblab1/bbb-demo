class RecordingsController < ApplicationController
  # displays all recordings
  def index
    # get all recordings
    @result = get_recordings()
  end

  # gets all recordings
  def get_recordings
    prepare()
    @api.get_recordings()
  end
end
