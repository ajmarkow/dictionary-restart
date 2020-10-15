require ("rspec")

class Word
  attr_accessor(:name, :id)
  @@words = {}
  @@total_rows = 0

  def self.all
    @@words.values()
  end

  def self.find(id)
    @@words[id]
  end

  def save
    @@words[self.id] = Word.new({ :name => self.name, :id => self.id })
  end

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = @id || @@total_rows += 1
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def update(name)
    @name = name
  end

  def delete
    @@words.delete(self.id)
  end

  def ==(word_to_compare)
    self.name() == word_to.name()
  end
end
