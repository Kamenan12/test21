class CreateCreateGbangbanThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :create_gbangban_themes do |t|
      t.integer :gbangban_id

      t.integer :theme_id   

      t.timestamps
    end
  end
end
