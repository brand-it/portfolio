require 'spec_helper'

describe "welcomes/show" do
  before(:each) do
    @welcome = assign(:welcome, stub_model(Welcome))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
