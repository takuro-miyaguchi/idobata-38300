class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.integer    :follower_id, null:false
      t.integer    :followee_id, null:false
      t.integer    :status     , null:false, defalt: 0
      t.timestamps
    end
  end
end
