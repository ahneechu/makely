require 'spec_helper'

describe "causes/new" do
  before(:each) do
    assign(:cause, stub_model(Cause).as_new_record)
  end

  it "renders new cause form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", causes_path, "post" do
    end
  end
end
