require 'rails_helper'

RSpec.describe Spend, type: :model do
  before do
    @user = User.create(name: 'Samantha Woods', email: 'sam@outlook.com', password: 'password',
                        password_confirmation: 'password')
    @group = Group.create(name: 'Pets', icon: 'pet_img', user: @user)
    @spend = Spend.create(name: 'Pet food', amount: 45, author: @user)
    @spend.groups << @group
  end

  context 'Test spend validations' do
    it 'is a spend with valid attributes' do
      expect(@spend).to be_valid
    end

    it 'amount should be great or equal than 0' do
      @spend.amount = -1
      expect(@spend).to_not be_valid
    end

    it 'name should be present' do
      @spend.name = nil
      expect(@spend).to_not be_valid
    end

    it 'amount should be present' do
      @spend.amount = nil
      expect(@spend).to_not be_valid
    end
  end
end
