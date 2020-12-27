class PagesController < ApplicationController

  def home
      @posts = Post.all

  end

  def allUsers
      if current_user

        friendIds = []

        @friendships = Friendship.where("status = #{Friendship.statuses[:friends]} AND (sender_id = #{current_user.id} OR recipient_id = #{current_user.id}) ").select('recipient_id', 'sender_id').distinct()
        if(@friendships != nil && @friendships.length > 0)
          @friendships.each do |f|
            if(f.recipient_id == current_user.id) 
              friendIds.push(f.sender_id.to_i) 
            else 
              friendIds.push(f.recipient_id.to_i ) 
            end
          end
        end

        @friends = User.where({ id: friendIds})

        pendingFriendshipIds = []

        @pendingFriendships = Friendship.where("(status = #{Friendship.statuses[:pending_first_second]} OR status = #{Friendship.statuses[:pending_second_first]}) AND recipient_id = #{current_user.id} ").select('sender_id')
        if(@pendingFriendships  != nil)
          @pendingFriendships.each do |f|
              pendingFriendshipIds.push(f.sender_id.to_i) 
            end
        end        
        @pendingFriendRequests = User.where({ id: pendingFriendshipIds})

        sentFriendshipIds = []

        @sentFriendships = Friendship.where("(status = #{Friendship.statuses[:pending_first_second]} OR status = #{Friendship.statuses[:pending_second_first]}) AND sender_id = #{current_user.id} ").select('recipient_id')
        if(@sentFriendships  != nil)
          @sentFriendships.each do |f|
              sentFriendshipIds.push(f.recipient_id.to_i) 
            end
          
        end        
        @sentFriendRequests = User.where({ id: sentFriendshipIds})

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
