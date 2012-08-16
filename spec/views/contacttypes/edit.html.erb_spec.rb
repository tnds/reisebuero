require 'spec_helper'

describe "contacttypes/edit" do
  before(:each) do
    @contacttype = assign(:contacttype, stub_model(Contacttype,
      :name => "MyString"
    ))
  end

  it "renders the edit contacttype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contacttypes_path(@contacttype), :method => "post" do
      assert_select "input#contacttype_name", :name => "contacttype[name]"
    end
  end
end
