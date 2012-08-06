require 'spec_helper'

describe "lodgings/index" do
  before(:each) do
    assign(:lodgings, [
      stub_model(Lodging,
        :event => "",
        :description => "MyText",
        :location => "MyText",
        :max_people => 1,
        :accessible => false,
        :maplink => "MyText",
        :request => false
      ),
      stub_model(Lodging,
        :event => "",
        :description => "MyText",
        :location => "MyText",
        :max_people => 1,
        :accessible => false,
        :maplink => "MyText",
        :request => false
      )
    ])
  end

  it "renders a list of lodgings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
