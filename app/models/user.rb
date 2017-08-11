class User < ApplicationRecord
  # Generate random auth_token
  before_create -> { self.auth_token = SecureRandom.hex }

  has_many :posts
  has_many :comments
  has_many :authentications

  validates_presence_of :email, :password
  # validates_format_of :email, with: /^$/
end
