class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
    	# foriegn key of the first user
    	t.integer "user1_id"
    	# foriegn key of the second user
    	t.integer "user2_id"
      t.timestamps null: false
    end
    add_index :friendships, ["user1_id", "user2_id"]
  end
end
