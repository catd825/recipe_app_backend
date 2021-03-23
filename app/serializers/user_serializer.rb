class UserSerializer < ActiveModel::Serializer
    # May need to remove :id 
    attributes :id, :username, :password, :name, :bio
end
  