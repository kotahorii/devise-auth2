class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :posts
end
