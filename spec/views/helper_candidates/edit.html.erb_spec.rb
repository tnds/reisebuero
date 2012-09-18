require 'spec_helper'

describe "helper_candidates/edit" do
  before(:each) do
    @helper_candidate = assign(:helper_candidate, stub_model(HelperCandidate))
  end

  it "renders the edit helper_candidate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => helper_candidates_path(@helper_candidate), :method => "post" do
    end
  end
end
