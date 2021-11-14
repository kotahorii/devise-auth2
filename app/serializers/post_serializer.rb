class PostSerializer < ActiveModel::Serializer
  attributes :id, :text, :user_id
  belongs_to :user, serializer: UserSerializer
end
