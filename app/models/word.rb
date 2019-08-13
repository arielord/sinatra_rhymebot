class Word < ActiveRecord::Base
  attr_accessor :rhyming_syllable, :syllables, :spelling

  has_many :user_words
  has_many :users, through: :user_words
end
