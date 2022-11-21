require 'rails_helper'

RSpec.describe 'Splashes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/splashes/index'
      expect(response).to have_http_status(:success)
    end
  end
end
