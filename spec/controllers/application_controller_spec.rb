require 'rails_helper'

RSpec.describe ApplicationController do

  describe "get_meetings" do
    it "checks that meetings are returned" do
      controller.get_meetings[:returncode].should == true
    end
  end
end
