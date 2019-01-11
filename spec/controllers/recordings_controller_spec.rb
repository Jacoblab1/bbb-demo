require 'rails_helper'

RSpec.describe RecordingsController do

  describe "get_recordings" do
    it "checks that recordings are returned" do
      controller.get_recordings[:returncode].should == true
    end
  end
end
