require 'spec_helper'

describe "bookings/index" do
  before(:each) do
    assign(:bookings, [
      stub_model(Booking,
        :lodging => nil,
        :persons => 1,
        :user => nil
      ),
      stub_model(Booking,
        :lodging => nil,
        :persons => 1,
        :user => nil
      )
    ])
  end

  it "renders a list of bookings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
