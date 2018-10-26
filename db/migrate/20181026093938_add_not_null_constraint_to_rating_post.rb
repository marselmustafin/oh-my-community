class AddNotNullConstraintToRatingPost < ActiveRecord::Migration[5.2]
  def change
    change_column_null :ratings, :post_id, false
  end
end
