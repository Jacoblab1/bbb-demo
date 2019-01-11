require 'spec_helper'

describe 'meetings/new.html.erb', type: :view do
  it 'displays missing fields error correctly' do
    flash[:missing] = true
    render
    rendered.should match('Error: Please fill all fields')
  end

end
