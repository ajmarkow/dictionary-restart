class Definition
  attr_accessor(:text, :word_id, :id)

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @text = attributes.fetch(:text)
    @word_id = attributes.fetch(:word_id)
    @id = attributes.fetch(:id) || @@total_rows +=1
  end

  def ==(definition_to_compare)
    (self.text() == definition_to_compare.text()) && (self.wordid() == definition_to_compare.wordid())
  end

  def self.all
    @@definitions.values()
  end

  def self.find(id)
    @@definitions[id]
  end

  def save
    @@definitions[self.id] = Definition.new({ :text => self.text, :word_id => self.word_id, :id => self.id })
  end

  def update(text)
    @text = text
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end

  def self.verbosefind(word_id)
    definitions = []
    @@definitions.values.each do |entry|
      if entry.word_id == word_id
        definitions.push(entry)
      end
      definitions
    end
    definitions
  end
end
