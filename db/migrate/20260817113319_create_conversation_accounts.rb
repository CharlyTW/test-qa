class CreateConversationAccounts < ActiveRecord::Migration[8.1]
  def change
    create_table :conversation_accounts do |t|
      t.references :conversation, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.integer :unread, null: false, default: 0
      t.datetime :archived_at

      t.timestamps
    end
    add_index :conversation_accounts, %i[conversation_id account_id], unique: true
  end
end
