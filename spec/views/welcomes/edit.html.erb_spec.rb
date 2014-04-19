require 'spec_helper'

describe "welcomes/edit" do
  before(:each) do
    @welcome = assign(:welcome, stub_model(Welcome))
  end

  it "renders the edit welcome form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", welcome_path(@welcome), "post" do
    end
  end
end
