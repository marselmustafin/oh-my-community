class AddRatingAndPostsCountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :posts_count, :integer, null: false, default: 0
    add_column :users, :rating, :float, null: false, default: 0.0
  end
end
