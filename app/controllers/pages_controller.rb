class PagesController < ApplicationController

  def home
      @posts = Post.all

  end

  def allUsers
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
