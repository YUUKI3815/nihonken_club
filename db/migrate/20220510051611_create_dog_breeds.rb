class CreateDogBreeds < ActiveRecord::Migration[6.1]
  def change
    create_table :dog_breeds do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
