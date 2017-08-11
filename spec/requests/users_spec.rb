require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }
  let(:user_id) { user.id }

  describe 'GET /users' do
    before do
      @headers = auth_headers
      get '/users', headers: @headers
    end

    it 'returns a list of users' do
      expect(json['data']).not_to be_empty
      expect(json['data'].size).to eq(10)
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:user_id' do
  end

  describe 'POST /users' do
  end

  describe 'PATCH /users/:user_id' do
  end

  describe 'DELETE /users/:user_id' do
  end
end
