require 'rails_helper'

RSpec.describe ConnectController do
  describe "check_valid" do
    it "checks for empty input" do
      controller.params[:password] = ""
      controller.params[:username] = "Guest"
      controller.params[:id] = "123"
      controller.check_valid.should == false
    end
  end

  describe "join_meeting_url" do
    it "checks that a url is returned" do
      controller.params[:password] = ""
      controller.params[:username] = "Guest"
      controller.params[:id] = "123"
      controller.get_meeting_url.should_not == nil
    end
  end
end
