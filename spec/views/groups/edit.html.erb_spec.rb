require 'rails_helper'

RSpec.describe 'groups/edit', type: :view do
  let(:group) do
    Group.create!(
      icon: 'MyString',
      name: 'MyString'
    )
  end

  before(:each) do
    assign(:group, group)
  end

  it 'renders the edit group form' do
    render

    assert_select 'form[action=?][method=?]', group_path(group), 'post' do
      assert_select 'input[name=?]', 'group[icon]'

      assert_select 'input[name=?]', 'group[name]'
    end
  end
end
