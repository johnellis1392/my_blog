require 'rails_helper'

RSpec.describe 'users/:user_id/posts API' do
  # let! is eager-loaded
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:posts) { create_list(:post, 10, user_id: user.id) }
  let!(:posts2) { create_list(:post, 10, user_id: user2.id) }

  # let is lazy-loaded
  let(:user_id) { user.id }
  let(:post_id) { posts.first.id }

  describe 'GET /users/:user_id/posts' do
    before do
      @headers = auth_headers
      get "/users/#{user_id}/posts", headers: @headers
    end

    context 'when the user exists' do
      it 'returns a list of posts for the given user' do
        expect(json['data']).not_to be_empty
        expect(json['data'].size).to eq(10)
      end

      it 'returns a 200 status code' do
        expect(response).to have_http_status(200)
      end
    end

    # TODO: Find a better way of generating auth_token's for invalid requests
    context 'when the user doesnt exist' do
      let(:user_id) { 0 }

      it 'returns a 404 status code' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    before do
      @headers = auth_headers
      get "/users/#{user_id}/posts/#{post_id}", headers: @headers
    end

    context 'when the user and the post exist' do
      it 'returns the selected post' do
        expect(json['data']).not_to be_empty

        post = posts.find { |item| item[:id] == post_id }
        expect(json['data']).to eq(
          'id' => post[:id].to_s,
          'type' => 'posts',
          'attributes' => {
            'title' => post[:title],
            'body' => post[:body]
          }
        )
      end

      it 'returns a 200 status code' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when user doesnt exist' do
      let(:user_id) { 0 }

      it 'returns a 404' do
        expect(response).to have_http_status(404)
      end
    end

    context 'when post doesnt belong to user' do
      let(:post_id) { posts2.first.id }

      it 'returns a 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
