require 'rails_helper'

RSpec.describe Authentication, type: :model do
  it { should belong_to(:user) }
  it { should validate_uniqueness_of(:provider) }
end
