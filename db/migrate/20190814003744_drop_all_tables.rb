class DropAllTables < ActiveRecord::Migration
  def change
    drop_table :users
    drop_table :words
    drop_table :user_words
  end
end
