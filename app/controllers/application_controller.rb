require 'bigbluebutton_api'

class ApplicationController < ActionController::Base
  def prepare
    url = "http://10.253.174.144/bigbluebutton/api"
    secret = "5c0bac3a78aab43ef22dc75e89312a5a"
    version = 0.81

    @api = BigBlueButton::BigBlueButtonApi.new(url, secret, version.to_s, true)
  end
end
