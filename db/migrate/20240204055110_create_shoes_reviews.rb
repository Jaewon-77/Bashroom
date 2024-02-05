class CreateShoesReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :shoes_reviews do |t|
      
      t.integer :user_id, null: false, default: ""
      t.string :title, null: false, default: ""
      t.text :review, null: false, default: ""
      t.integer :traction, null: false, default: ""
      t.integer :cushion, null: false, default: ""
      t.integer :fit, null: false, default: ""
      t.integer :support, null: false, default: ""
      t.integer :weight, null: false, default: ""

      t.timestamps
    end
  end
end
