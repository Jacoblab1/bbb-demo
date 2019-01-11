require 'rails_helper'

RSpec.describe ApplicationController do

  before do
    @options = {
      :attendeePW=> "attPW",
      :moderatorPW => "modPW",
      :welcome => "Welcome to the RSpec test meeting!",
      :record => true
    }
  end

  describe "get_meetings" do
    it "checks that meetings are returned" do
      controller.get_meetings[:returncode].should == true
    end
  end

  describe "int_to_boolean" do
    it "returns true if given integer value 1" do
      controller.int_to_boolean(1).should == true
    end

    it "returns false if given anything not 1" do
      controller.int_to_boolean("abc").should == false
    end
  end

  describe "make_meeting" do
    it "makes a meeting" do
      controller.make_meeting("RSpec Test Meeting", "3.141519", @options)[:returncode].should == true
    end
  end
  describe "meeting_running" do
    it "checks that a meeting isn't running" do
      controller.meeting_running?("not_a_real_meeting").should == false
    end
  end
end
