module Types

  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :post, PostType, null: true do
      description "Find a Post by ID"
      argument :id, ID, required: false
    end

    def post(id:)
      Post.find(id)
    end

    # First describe the field signature:
    field :user, UserType, null: true do
      description "Find a User by ID"
      argument :id, ID, required: false
    end

    def user(id:)
      User.find(id)
    end

    field :all_users, [UserType], null: false
    def all_users
      User.all
    end

    field :all_posts, [PostType], null: false
    def all_posts
      Post.all.order(created_at: :desc)
    end

  end

end
