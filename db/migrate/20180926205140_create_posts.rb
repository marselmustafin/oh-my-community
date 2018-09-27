class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.references :author, null: false
      t.references :community, null: false

      t.timestamps
    end
  end
end
