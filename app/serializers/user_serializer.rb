class UserSerializer < ActiveModel::Serializer
  # Specify single attribute, with new name
  # attribute :title, key: :name

  # Specify which attributes to serialize
  attributes :id, :email, :created_at, :say_hello

  # Include posts
  has_many :posts

  # Included method for dynamically rendering properties
  def say_hello
    "Hello, #{object.email}!"
  end
end
