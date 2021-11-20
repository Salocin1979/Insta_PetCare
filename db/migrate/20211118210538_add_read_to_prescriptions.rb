class AddReadToPrescriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :prescriptions, :read, :boolean
  end
end
