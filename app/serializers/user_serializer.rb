class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :beenz, :gravatar_url
end
