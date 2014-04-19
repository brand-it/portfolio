require 'spec_helper'

describe "welcomes/index" do
  before(:each) do
    assign(:welcomes, [
      stub_model(Welcome),
      stub_model(Welcome)
    ])
  end

  it "renders a list of welcomes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
