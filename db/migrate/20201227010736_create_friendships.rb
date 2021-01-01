class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :sender
      t.references :recipient
      t.column :status, :integer, null: false, default: 0
    end

    add_foreign_key :friendships, :users, column: :sender_id, primary_key: :id
    add_foreign_key :friendships, :users, column: :recipient_id, primary_key: :id
  end
end
