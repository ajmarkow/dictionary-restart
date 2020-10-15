class Definition
  attr_reader(:id)
  attr_accessor(:text, :wordid)

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @text = attributes.fetch(:text)
    @wordid = attributes.fetch(:wordid)
    @id = id || @@total_rows += 1
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
    @@definitions[self.id] = Definition.new({ :text => self.text, :wordid => self.wordid, :id => self.id })
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
end
