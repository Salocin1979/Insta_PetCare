class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :age
      t.float :weight
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
