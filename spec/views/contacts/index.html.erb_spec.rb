require 'spec_helper'

describe "contacts/index" do
  before(:each) do
    assign(:contacts, [
      stub_model(Contact,
        :user => nil,
        :contacttype => nil,
        :address => "Address",
        :public => false
      ),
      stub_model(Contact,
        :user => nil,
        :contacttype => nil,
        :address => "Address",
        :public => false
      )
    ])
  end

  it "renders a list of contacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
