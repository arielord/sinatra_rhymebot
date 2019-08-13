class Rhymebot

  # @@rhymes = {}

  def initialize()

  end

  def self.find_best_rhymes(word)
    best_rhymes = {}
    word = Word.find(word.upcase)

    rs = word.rhyming_syllable
    w = word.word
    syll = word.syllables

    @@rhymes[rs].each do |rhyme|
      counter = 0

      rhyme_rs = rhyme.rhyming_syllable
      rhyme_word = rhyme.word
      rhyme_syll = rhyme.syllables

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
      best_rhymes[rhyme_word] = counter
    end
    #return hash of best rhymes
    best_rhymes
  end

  # def self.rhymes
  #   @@rhymes
  # end
end
