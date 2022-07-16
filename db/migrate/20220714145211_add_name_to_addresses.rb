class AddNameToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :name, :string, null: false
  end
end
