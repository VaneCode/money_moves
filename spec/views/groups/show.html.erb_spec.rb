require 'rails_helper'

RSpec.describe "groups/show", type: :view do
  before(:each) do
    assign(:group, Group.create!(
      icon: "Icon",
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Icon/)
    expect(rendered).to match(/Name/)
  end
end
