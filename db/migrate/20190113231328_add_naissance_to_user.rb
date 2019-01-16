class AddNaissanceToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :naissance, :date
  end
end
