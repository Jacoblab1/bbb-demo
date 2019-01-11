require 'spec_helper'

describe 'connect/index.html.erb', type: :view do
  it 'displays missing inputs error correctly' do
    @missing = true
    render
    rendered.should match('Error: Please fill all fields')
  end
  it 'displays error joining meeting correctly' do
    @error = true
    render
    rendered.should match('Error: Incorrect ID or password')
  end
end
