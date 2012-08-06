require 'spec_helper'

describe "lodgings/new" do
  before(:each) do
    assign(:lodging, stub_model(Lodging,
      :event => "",
      :description => "MyText",
      :location => "MyText",
      :max_people => 1,
      :accessible => false,
      :maplink => "MyText",
      :request => false
    ).as_new_record)
  end

  it "renders new lodging form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lodgings_path, :method => "post" do
      assert_select "input#lodging_event", :name => "lodging[event]"
      assert_select "textarea#lodging_description", :name => "lodging[description]"
      assert_select "textarea#lodging_location", :name => "lodging[location]"
      assert_select "input#lodging_max_people", :name => "lodging[max_people]"
      assert_select "input#lodging_accessible", :name => "lodging[accessible]"
      assert_select "textarea#lodging_maplink", :name => "lodging[maplink]"
      assert_select "input#lodging_request", :name => "lodging[request]"
    end
  end
end
