require 'spec_helper'

describe "bookings/new" do
  before(:each) do
    assign(:booking, stub_model(Booking,
      :lodging => nil,
      :persons => 1,
      :user => nil
    ).as_new_record)
  end

  it "renders new booking form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bookings_path, :method => "post" do
      assert_select "input#booking_lodging", :name => "booking[lodging]"
      assert_select "input#booking_persons", :name => "booking[persons]"
      assert_select "input#booking_user", :name => "booking[user]"
    end
  end
end
