require ("rspec")

class Word
  attr_accessor(:name, :id)
  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def self.find(id)
    @@words[id.to_i]
  end

  def save
    @@words[self.id] = Word.new({ :name => self.name, :id => self.id })
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
    self.name() == word_to_compare.name()
  end

  def get_definition
    Definition.verbosefind(self.id)
  end
end
