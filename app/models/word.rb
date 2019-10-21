class Word < ActiveRecord::Base
  has_many :user_words
  has_many :users, through: :user_words

  def last_vowel_placement()
    vowels = ['A', 'E', 'I', 'O', 'U']
    counter = 0
    self.syllables.split.reverse.each do |s|
      counter += 1
      if vowels.include?(s[0])
        break
      end
    end
    counter
  end

  def test()
    "Hello World"
  end
end
