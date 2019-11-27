module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :created_at, String, null: false
    field :images, String, null: false
    field :user_id, ID, null: false
  end
end
