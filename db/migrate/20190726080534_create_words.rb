class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.string :syllables
      t.string :rhyming_syllable

      t.timestamps null: false
    end
  end
end
