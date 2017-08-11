require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }

  before do
    # @logged_in_user = create(:user)
    # sign_in @logged_in_user
  end

  describe 'index' do
    before do
      @headers = auth_headers
      # @headers.dup # Duplicate Hash
      # @headers.merge({ "Content-Type": "application/json" }) # Combine hashes
      # get :index, format: :json, headers: @headers
    end

    # it 'returns a list of users', focus: true do
    #   # get :index, format: :json, headers: @headers
    #   expect(json['data']).not_to be_empty
    #   expect(json['data'].size).to eq(10)
    #
    #   # TODO: Figure out an effective way to serialize models on the fly
    #   # @users.each do |user|
    #   #   expect(json['data']).to include(user)
    #   # end
    # end
  end
end
