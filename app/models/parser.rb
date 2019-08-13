class Parser
  @@all = {}

  def self.pronunciation_parser()
    cmudict = "/Users/ariel/OneDrive/Flatiron/sinatra_rhymebot/public/pronunciationDictionary/cmudict-0.7b.txt"
    File.foreach(cmudict) do |line|
      if line[0] < 'A'
        next
      elsif line[0] > 'Z'
        next
      else
        word = line.split[0]
        syllables = line.split[1...line.split.length]
        rhyming_syllable = syllables[-1]
        w = Word.new(word: word, syllables: syllables, rhyming_syllable: rhyming_syllable)

        if Rhymebot.rhymes.key?(w.rhyming_syllable)
          Rhymebot.rhymes[w.rhyming_syllable] << w
        else
          Rhymebot.rhymes[rhyming_syllable] = [w]
        end
      end
    end
  end

end
