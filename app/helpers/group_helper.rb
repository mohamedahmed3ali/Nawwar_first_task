module GroupHelper
	def is_follower?(user_id, group_id)
		# @followship = Groups_user.where('user_id = ? AND group_id = ?', user_id, group_id)
		@followship = current_user.groups(group_id)
		if !@followship.empty?
			return true
		else
			return false
		end

	end	
end
