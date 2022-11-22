require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = User.create(name: 'Samantha Woods', email: 'sam@outlook.com', password: 'password',
                        password_confirmation: 'password')
    @group = Group.create(name: 'Pets', icon: 'pet_img', user: @user)
    @spend = Spend.create(name: 'Pet food', amount: 45, author: @user)
    @spend.groups << @group
  end

  context 'Test group validations' do
    it 'is a group with valid attributes' do
      expect(@group).to be_valid
    end

    it 'name should be present' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'icon should be present' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end
  end
end
