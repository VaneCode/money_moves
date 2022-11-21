require 'rails_helper'

RSpec.describe "spends/edit", type: :view do
  let(:spend) {
    Spend.create!(
      name: "MyString",
      amount: "9.99"
    )
  }

  before(:each) do
    assign(:spend, spend)
  end

  it "renders the edit spend form" do
    render

    assert_select "form[action=?][method=?]", spend_path(spend), "post" do

      assert_select "input[name=?]", "spend[name]"

      assert_select "input[name=?]", "spend[amount]"
    end
  end
end
