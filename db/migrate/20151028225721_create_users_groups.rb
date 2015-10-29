class CreateUsersGroups < ActiveRecord::Migration
  def change
    create_table :users_groups, :id => false do |t|
       	# foriegn key of the user
    	t.integer "user_id"
     	# foriegn key of the group
    	t.integer "group_id"

    end
    add_index :users_groups, ["user_id", "group_id"]
  end
end
