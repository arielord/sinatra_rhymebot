class AddAttributesToUserWords < ActiveRecord::Migration
  def change
    add_column :user_words, :user_id, :integer
    add_column :user_words, :word_id, :integer
  end
end
