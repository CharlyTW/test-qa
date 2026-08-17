class CreateAccounts < ActiveRecord::Migration[8.1]
  def change
    create_table :accounts do |t|
      t.string :slug
      t.string :display_name

      t.timestamps
    end
    add_index :accounts, :slug, unique: true
  end
end
