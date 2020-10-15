require ("rspec")

class Word
  attr_accessor(:name, :wordid)
  @@words = {}
  @@total_rows = 0

  def self.all
    @@words.values()
  end

  def self.find(wordid)
    @@words[wordid]
  end

  def save
    @@words[self.wordid] = Word.new({ :name => self.name, :wordid => self.wordid })
  end

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @wordid = @wordid || @@total_rows += 1
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def update(name)
    @name = name
  end

  def delete
    @@words.delete(self.wordid)
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end
end
