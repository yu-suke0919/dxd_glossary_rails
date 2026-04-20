class CreateComments < ActiveRecord::Migration[8.1]
  def change
    create_table :comments do |t|
      t.integer :comment_number, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
