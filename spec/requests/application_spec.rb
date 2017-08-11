require 'rails_helper'

RSpec.describe ApplicationController, type: :request do
  let!(:user) { create(:user) }
  let(:auth_token) { user.auth_token }

  describe 'GET /token' do
    context 'when the user exists' do
      before do
        @headers = basic_auth_headers
        get '/token', headers: @headers
      end

      it 'returns the auth_token for the user' do
        body = JSON.parse(response.body)
        expect(body['token']).to eq(auth_token)
      end

      it 'returns a 200 status' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user doesnt exist' do
      before do
        @headers = mock_basic_auth_headers
        get '/token', headers: @headers
      end

      it 'returns a 401 status' do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'GET /reauth' do
    context 'when the user exists' do
      before do
        @headers = auth_headers
        get '/reauth', headers: @headers
      end

      # User 'focus: true' to run single test
      # it 'returns a success message', focus: true do
      it 'returns a success message' do
        expect(json['message']).to eq('Success!')
      end

      it 'returns a 200 status' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user doesnt exist' do
      before do
        @headers = mock_auth_headers
        get '/reauth', headers: @headers
      end

      it 'returns a 401 status' do
        expect(response).to have_http_status(401)
      end
    end
  end
end
