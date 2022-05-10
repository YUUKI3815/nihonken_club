class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.integer :dog_breeds_id
      t.integer :user_id
      t.string :name
      t.text :introduction
      t.integer :age
      t.string :gender
      t.timestamps
    end
  end
end
