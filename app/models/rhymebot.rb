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

  def self.find_best_rhymes(word)
    best_rhymes = {}
    word = Word.find_by(spelling: word.upcase)

    rs = word.rhyming_syllable
    w = word.spelling
    syll = word.syllables

    Word.where(rhyming_syllable: rs).each do |rhyme|
      counter = 0

      rhyme_rs = rhyme.rhyming_syllable
      rhyme_word = rhyme.spelling
      rhyme_syll = rhyme.syllables.split()

      if syll.length <= rhyme_syll.length
        less_syll = syll
        more_syll = rhyme_syll
      else
        less_syll = rhyme_syll
        more_syll = syll
      end

      for i in 1..less_syll.length
        if less_syll[-i] == more_syll[-i]
          counter = counter + 1
        else
          break
        end
      end
      #add rhymes with its rhyme strength as denoted by the counter
      if best_rhymes[counter]
        best_rhymes[counter] = best_rhymes[counter].push(rhyme_word)
      else
        best_rhymes[counter] = [rhyme_word]
      end
    end
    #return hash of best rhymes
    best_rhymes
  end

  # def self.rhymes
  #   @@rhymes
  # end
end
