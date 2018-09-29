class AddAverageRatingToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :average_rating, :float, null: false, default: 0.0
  end
end
