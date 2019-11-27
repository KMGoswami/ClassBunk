module Types
  class MutationType < Types::BaseObject

     field :create_post, mutation: Mutations::CreatePost
     field :sign_in_user, mutation: Mutations::SignInUser
  end
end
