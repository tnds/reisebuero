require 'spec_helper'

describe "lodgings/show" do
  before(:each) do
    @lodging = assign(:lodging, stub_model(Lodging,
      :event => nil,
      :user => nil,
      :max_people => 1,
      :accessible => false,
      :description => "MyText",
      :location => "MyText",
      :maplink => "MyText",
      :request => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
