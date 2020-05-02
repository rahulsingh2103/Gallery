class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :album, null: false, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
