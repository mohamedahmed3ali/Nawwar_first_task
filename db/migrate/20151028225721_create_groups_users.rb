class CreateGroupsUsers < ActiveRecord::Migration
  def change
    create_table :groups_users, :id => false do |t|
       	# foriegn key of the group
    	t.integer "group_id"  
    	# foriegn key of the user
    	t.integer "user_id"


    end
    add_index :groups_users, [ "group_id", "user_id"]
  end
end
