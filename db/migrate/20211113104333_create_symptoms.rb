class CreateSymptoms < ActiveRecord::Migration[6.0]
  def change
    create_table :symptoms do |t|
      t.string :description
      t.text :suggestion
      t.integer :specie_id
      t.timestamps
    end
  end
end
