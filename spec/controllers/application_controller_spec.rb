require 'rails_helper'

RSpec.describe ApplicationController do

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
end
