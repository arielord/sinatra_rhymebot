class AddSpellingSyllablesAndRhymingSyllableToWord < ActiveRecord::Migration
  def change
    add_column :words, :spelling, :string
    add_column :words, :syllables, :string
    add_column :words, :rhyming_syllable, :string
  end
end
