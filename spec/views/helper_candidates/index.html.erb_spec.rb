require 'spec_helper'

describe "helper_candidates/index" do
  before(:each) do
    assign(:helper_candidates, [
      stub_model(HelperCandidate),
      stub_model(HelperCandidate)
    ])
  end

  it "renders a list of helper_candidates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
