require 'rails_helper'

RSpec.describe 'spends/new', type: :view do
  before(:each) do
    assign(:spend, Spend.new(
                     name: 'MyString',
                     amount: '9.99'
                   ))
  end

  it 'renders new spend form' do
    render

    assert_select 'form[action=?][method=?]', spends_path, 'post' do
      assert_select 'input[name=?]', 'spend[name]'

      assert_select 'input[name=?]', 'spend[amount]'
    end
  end
end
