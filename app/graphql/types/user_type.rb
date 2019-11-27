# app/graphql/types/post_type.rb
module Types
  class UserType < Types::BaseObject
    description "User record details"
    field :id, ID, null: false
    field :lastName, String, null: false
    field :firstName, String, null: false
    field :email, String, null: false
    field :created_at, String, null: false
  end

end
