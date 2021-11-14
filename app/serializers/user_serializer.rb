class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name
end

class UserPostSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :posts
end
