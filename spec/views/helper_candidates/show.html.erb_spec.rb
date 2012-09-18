require 'spec_helper'

describe "helper_candidates/show" do
  before(:each) do
    @helper_candidate = assign(:helper_candidate, stub_model(HelperCandidate))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
