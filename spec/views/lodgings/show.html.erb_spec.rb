require 'spec_helper'

describe "lodgings/show" do
  before(:each) do
    @lodging = assign(:lodging, stub_model(Lodging,
      :event => "",
      :description => "MyText",
      :location => "MyText",
      :max_people => 1,
      :accessible => false,
      :maplink => "MyText",
      :request => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
