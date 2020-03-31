class Rhymebot

  # @@rhymes = {}

  def initialize()

  end

  def self.phoneme_count(word)
    word.syllables.split.length
  end

  def self.count_rhyming_syllables(word1, word2)
    least_syllables = phoneme_count(word1) < phoneme_count(word2) ? phoneme_count(word1) : phoneme_count(word2)
    counter = 0

    for i in 1..least_syllables
      if word1.syllables.split[-i] == word2.syllables.split[-i]
        counter += 1
      else
        break
      end
    end

      counter
  end

  def self.find_best_rhymes(word1)
    best_rhymes = {}

    Word.where(rhyming_syllable: word1.rhyming_syllable).each do |word2|
      matching_syllables = count_rhyming_syllables(word1, word2)

      if best_rhymes[matching_syllables]
        best_rhymes[matching_syllables] = best_rhymes[matching_syllables].push(word2.spelling)
      else
        best_rhymes[matching_syllables] = [word2.spelling] if matching_syllables > 0
      end
    end
    #return hash of best rhymes
    best_rhymes
  end

  # def self.rhymes
  #   @@rhymes
  # end
end
