class CreateCommentaires < ActiveRecord::Migration[5.2]
  def change
    create_table :commentaires do |t|
      t.text :content
      t.references :gbangban, foreign_key: true

      t.timestamps
    end
  end
end
