class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end

    add_index :relationships, :followed_id
    add_index :relationships, :follower_id
    #So that a user cannot follow another user more than once. 
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
