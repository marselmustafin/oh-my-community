class ReindexUsersByEmailAndCompanyId < ActiveRecord::Migration[5.2]
  def up
    remove_index :users, :email
    add_index :users, [:email, :community_id], :unique => true
  end

  def down
    remove_index :users, [:email, :community_id]
    add_index :users, :email, :unique => true
  end
end
