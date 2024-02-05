class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :shoes_review_id
      t.integer :user_id
      t.text :user_comment

      t.timestamps
    end
  end
end
