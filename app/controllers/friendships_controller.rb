class FriendshipsController < ApplicationController

	before_action :authenticate_user!
	
	def sendFriendRequest
		friendRequest = Friendship.new()
		friendRequest.status = "pending_first_second"
		friendRequest.sender_id = current_user.id
		friendRequest.recipient_id = params[:recipient_id]
		puts current_user.id
		puts friendRequest
		friendRequest.save
		redirect_to allUsersGet_path
	end

	def friendrequests

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

  end

  def acceptFriendRequest
    begin
      if(params.has_key?(:sender_id) && params.has_key?(:recipient_id))
        @friendship = Friendship.find_by("sender_id = :senderid AND recipient_id = :recipientid", {senderid: params[:sender_id], recipientid: params[:recipient_id] })
        @friendship.update(status: Friendship.statuses[:friends])
        redirect_to action: "friendrequests"
      else
        redirect_to action: "friendrequests"
      end
    rescue StandardError => e
      print e
    end
  end

  def listFriends
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
  end
  
end
