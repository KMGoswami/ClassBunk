require 'GraphQL'

class PagesController < ApplicationController

  def home
    posts_query = "{
        allPosts{
          id
          title
          createdAt
          images
        }
    }"
    
    @posts = ClassBunkSchema.execute(posts_query)

  end

  def allUsers
    query_string = "
    mutation{
      signInUser(
        email: {
          email: \"k@m.g\",
          password: \"passwd\"
        }
      )
      {
        token
        user{
          id
          email
        }
      }
      }"


      @result_hash = ClassBunkSchema.execute(query_string)

      if current_user
        @users = if params[:query]
          User.where("id != #{current_user.id} AND email LIKE ? ", "%#{params[:query]}%")
        else
          User.where("id != #{current_user.id}" )
        end
      else
        redirect_to action: "home"
      end
    end


  end
