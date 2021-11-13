class AddDateToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :date, :date
  end
end
