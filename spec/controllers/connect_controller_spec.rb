require 'rails_helper'

RSpec.describe ConnectController do
  before do
    controller.params[:password] = ""
    controller.params[:username] = "Guest"
    controller.params[:id] = "123"
  end
  
  describe "check_valid" do
    it "checks for empty input" do
      controller.check_valid.should == false
    end
  end

  describe "join_meeting_url" do
    it "checks that a url is returned" do
      controller.get_meeting_url.should_not == nil
    end
  end
end
