# frozen_string_literal: true

class AddProfileFieldsToAccounts < ActiveRecord::Migration[8.1]
  def change
    add_column :accounts, :first_name, :string
    add_column :accounts, :last_name, :string
    add_column :accounts, :role, :string
  end
end
