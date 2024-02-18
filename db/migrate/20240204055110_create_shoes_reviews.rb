class CreateShoesReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :shoes_reviews do |t|
      
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :review, null: false
      t.integer :traction, null: false
      t.integer :cushion, null: false 
      t.integer :fit, null: false 
      t.integer :support, null: false
      t.integer :weight, null: false

      t.timestamps
    end
  end
end
