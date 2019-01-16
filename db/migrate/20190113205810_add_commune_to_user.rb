class AddCommuneToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :commune, :string
  end
end
