class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :titre
      t.string :sous_titre

      t.timestamps
    end
  end
end
