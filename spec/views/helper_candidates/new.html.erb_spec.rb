require 'spec_helper'

describe "helper_candidates/new" do
  before(:each) do
    assign(:helper_candidate, stub_model(HelperCandidate).as_new_record)
  end

  it "renders new helper_candidate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => helper_candidates_path, :method => "post" do
    end
  end
end
