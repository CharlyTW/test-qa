class CreateListings < ActiveRecord::Migration[8.1]
  def change
    create_table :listings do |t|
      t.references :account, null: false, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
