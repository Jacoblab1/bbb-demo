class RecordingsController < ApplicationController
  def index
    prepare()
    recordings = @api.get_recordings()
    # get all recordings
    puts "---------------RECORDINGS OUTPUT-------------"
    puts recordings
  end
end
