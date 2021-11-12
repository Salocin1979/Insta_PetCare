class CreatePrescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :prescriptions do |t|
      t.text :content
      t.date :date
      t.references :consultation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
