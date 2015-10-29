class Group < ActiveRecord::Base
	has_and_belongs_to_many :followers, :class_name => 'User'
	
	# allow the group to have an image using Avatar uploader
    mount_uploader :image, AvatarUploader 
    
	scope :sorted, lambda { order("groups.id DESC")}
end  
