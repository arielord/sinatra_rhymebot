class CreateUserWords < ActiveRecord::Migration
  def change
    create_table :user_words do |t|

      t.timestamps null: false
    end
  end
end
