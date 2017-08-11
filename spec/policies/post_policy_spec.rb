require 'rails_helper'

RSpec.describe PostPolicy do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:posts) { create_list(:post, 3, user_id: user.id) }
  let(:post) { posts.first }

  subject { described_class }

  permissions '.scope' do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :show? do
    it 'allows all users' do
      expect(subject).to permit(user2, post)
    end
  end

  permissions :create? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :update?, :destroy? do
    it 'grants access to the owning user' do
      expect(subject).to permit(user, post)
    end

    it 'denies access to non-owning users' do
      expect(subject).not_to permit(user2, post)
    end
  end
end
