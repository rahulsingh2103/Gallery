class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :user
      t.string :title
      t.string :description
      t.string :tag

      t.timestamps
    end
  end
end
