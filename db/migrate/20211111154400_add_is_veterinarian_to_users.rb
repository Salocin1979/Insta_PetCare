class AddIsVeterinarianToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_veterinarian, :boolean
  end
end
