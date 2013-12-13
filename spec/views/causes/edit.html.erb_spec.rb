require 'spec_helper'

describe "causes/edit" do
  before(:each) do
    @cause = assign(:cause, stub_model(Cause))
  end

  it "renders the edit cause form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cause_path(@cause), "post" do
    end
  end
end
