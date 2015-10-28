class Friendship < ActiveRecord::Base
	# performs the many to many associations between the users and themselves
  belongs_to :user1, :class_name => :User
  belongs_to :user2, :class_name => :User

end
