class Ownership < ActiveRecord::Base
	belongs_to :editor, :class_name => "User", :foreignkey => "user_id"
	belongs_to :group
end
