class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user,       null: false, foreign_key: true
      t.float :weight,          null: false
      t.float :fat_percentage
      t.date :schedule_date
      t.integer :today1_id
      t.string :today1_memo
      t.integer :today2_id
      t.string :today2_memo
      t.integer :today3_id
      t.string :today3_memo
      t.text :memo
      t.timestamps
    end
  end
end
