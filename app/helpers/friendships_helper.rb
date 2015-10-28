module FriendshipsHelper
	def are_friends?(id1, id2)
		@friends = Friendship.where('user1_id = ? AND user2_id = ?', id1, id2)
		if !@friends.empty?
			return true
		else
			@friends2 = Friendship.where('user1_id = ? AND user2_id = ?', id2, id1)
			if !@friends2.empty?
				return true
			end
			return false
		end

	end	
end
