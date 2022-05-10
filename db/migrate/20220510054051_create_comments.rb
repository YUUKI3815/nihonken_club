class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :dog_image_id
      t.text :comment
      t.timestamps
    end
  end
end
