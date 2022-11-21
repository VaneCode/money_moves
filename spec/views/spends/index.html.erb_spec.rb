require 'rails_helper'

RSpec.describe "spends/index", type: :view do
  before(:each) do
    assign(:spends, [
      Spend.create!(
        name: "Name",
        amount: "9.99"
      ),
      Spend.create!(
        name: "Name",
        amount: "9.99"
      )
    ])
  end

  it "renders a list of spends" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end
