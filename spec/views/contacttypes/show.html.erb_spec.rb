require 'spec_helper'

describe "contacttypes/show" do
  before(:each) do
    @contacttype = assign(:contacttype, stub_model(Contacttype,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
