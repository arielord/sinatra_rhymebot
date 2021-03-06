class Parser
  @@all = {}

  def self.pronunciation_parser()
    vowels = ['A', 'E', 'I', 'O', 'U']
    cmudict = "/Users/ariel/OneDrive/Flatiron/sinatra_rhymebot/public/pronunciationDictionary/cmudict-0.7b.txt"
    File.foreach(cmudict) do |line|
      if line[0] < 'A'
        next
      elsif line[0] > 'Z'
        next
      else
        spelling = line.split[0]
        spelling = spelling[0...spelling.length-3] if spelling[-1] == ')'
        syllables = line.split[1...line.split.length]
        rhyming_syllable = syllables[-1]

        # extra code if I want to rhyme with the final vowel instead of final consonant
        # last_vowel = ''
        #
        # syllables.reverse.each do |s|
        #   if vowels.include?(s[0])
        #     last_vowel = s
        #     break
        #   end
        # end

        syllables = syllables.join(' ')

        w = Word.create(spelling: spelling, syllables: syllables, rhyming_syllable: rhyming_syllable)
      end
    end
  end

end
