class Friendship < ActiveRecord::Base

	enum status: { pending_first_second: 0, pending_second_first: 1, friends: 2, block_first_second: 3, block_second_first: 4, block_both: 5}

	belongs_to :recipient, :class_name => 'User'
  	belongs_to :sender, :class_name => 'User'

end