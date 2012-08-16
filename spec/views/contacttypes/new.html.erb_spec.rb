require 'spec_helper'

describe "contacttypes/new" do
  before(:each) do
    assign(:contacttype, stub_model(Contacttype,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new contacttype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contacttypes_path, :method => "post" do
      assert_select "input#contacttype_name", :name => "contacttype[name]"
    end
  end
end
