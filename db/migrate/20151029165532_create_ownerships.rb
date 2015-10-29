class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
    	t.references :user
    	t.references :group
      t.timestamps null: false
    end
    add_index :ownerships, ["user_id", "group_id"]
  end
end
