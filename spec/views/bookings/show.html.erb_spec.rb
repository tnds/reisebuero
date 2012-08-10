require 'spec_helper'

describe "bookings/show" do
  before(:each) do
    @booking = assign(:booking, stub_model(Booking,
      :lodging => nil,
      :persons => 1,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
