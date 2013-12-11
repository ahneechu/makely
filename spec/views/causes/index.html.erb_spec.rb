require 'spec_helper'

describe "causes/index" do
  before(:each) do
    assign(:causes, [
      stub_model(Cause),
      stub_model(Cause)
    ])
  end

  it "renders a list of causes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
