# frozen_string_literal: true

class AddTelAndBirthDayToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true
    add_column :users, :birthday, :date
  end
end
