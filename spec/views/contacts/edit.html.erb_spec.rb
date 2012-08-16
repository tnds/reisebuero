require 'spec_helper'

describe "contacts/edit" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :user => nil,
      :contacttype => nil,
      :address => "MyString",
      :public => false
    ))
  end

  it "renders the edit contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contacts_path(@contact), :method => "post" do
      assert_select "input#contact_user", :name => "contact[user]"
      assert_select "input#contact_contacttype", :name => "contact[contacttype]"
      assert_select "input#contact_address", :name => "contact[address]"
      assert_select "input#contact_public", :name => "contact[public]"
    end
  end
end
