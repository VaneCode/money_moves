require 'rails_helper'

RSpec.describe SpendsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/groups/1/spends').to route_to('spends#index', group_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/groups/1/spends/new').to route_to('spends#new', group_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/groups/1/spends').to route_to('spends#create', group_id: '1')
    end
  end
end
