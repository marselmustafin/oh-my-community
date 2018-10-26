class AddForeignKeysToAllTables < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :ratings, :posts
    remove_foreign_key :ratings, :users
    add_foreign_key :ratings, :posts, on_delete: :cascade
    add_foreign_key :ratings, :users, on_delete: :nullify
    add_foreign_key :comments, :users, column: :commenter_id, on_delete: :cascade
    add_foreign_key :comments, :posts, on_delete: :cascade
    add_foreign_key :posts, :communities, on_delete: :cascade
    add_foreign_key :users, :communities, on_delete: :cascade
  end
end
