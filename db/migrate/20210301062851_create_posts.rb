class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :prefecture_id, null: false
      t.string :place_name, null: false
      t.text :place_detail, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
