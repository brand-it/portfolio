require 'spec_helper'

describe "welcomes/new" do
  before(:each) do
    assign(:welcome, stub_model(Welcome).as_new_record)
  end

  it "renders new welcome form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", welcomes_path, "post" do
    end
  end
end
