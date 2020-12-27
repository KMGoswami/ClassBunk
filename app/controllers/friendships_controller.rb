class FriendshipsController < ApplicationController

	def sendFriendRequest
		friendRequest = Friendship.new()
		friendRequest.status = "pending_first_second"
		friendRequest.sender_id = current_user.id
		friendRequest.recipient_id =  params[:recipient_id]
		puts current_user.id
		puts friendRequest
		friendRequest.save
		redirect_to allUsersGet_path
	end

end
