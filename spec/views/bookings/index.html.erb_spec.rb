require 'spec_helper'

describe "bookings/index" do
  before(:each) do
    assign(:bookings, [
      stub_model(Booking,
        :lodging => "",
        :persons => 1,
        :user => ""
      ),
      stub_model(Booking,
        :lodging => "",
        :persons => 1,
        :user => ""
      )
    ])
  end

  it "renders a list of bookings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
