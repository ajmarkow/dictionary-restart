require("Word")
require("rspec")

describe ("Word") do
  it("returns an empty array for storing word hashes") do
    expect(Word.all).to(eq([]))
  end
end

describe("#==") do
  it("is the same word if it has the same attributes as another word") do
    word = Word.new({ :name => "car", :id => nil })
    word2 = Word.new({ :name => "car", :id => nil })
    expect(word).to(eq(word2))
  end
end

describe("save") do
  it("adds a new word to the @@wordcontainer hash") do
    testword2 = Word.new({ :name => "car", :id => nil })
    testword2.save()
    expect(testword2.name).to eq("car")
  end
end

describe("clear") do
  it("clears words") do
    testword = Word.new({ :name => "car", :id => nil })
    Word.clear()
    expect(Word.all).to(eq([]))
  end
end

describe("delete") do
  it("removes a word from the words class variable") do
    testword4 = Word.new({ :name => "car", :id => nil })
    testword3 = Word.new({ :name => "animal", :id => nil })
    testword4.save()
    testword3.save()
    testword4.delete()
    expect(Word.all).to(eq([testword3]))
  end
end

describe("update") do
  it("changes a word") do
    testword = Word.new({ :name => "car", :id => nil })
    testword.update("automobile")
    expect(testword.name).to(eq("automobile"))
  end
end

describe("find") do
  it("returns a specific word") do
    testword6 = Word.new({ :name => "motorcycle", :definition => "a vehicle with two wheels", :id => nil })
    testword7 = Word.new({ :name => "car", :id => 7 })
    testword6.save()
    testword7.save()
    expect(Word.find(7)).to(eq(testword7))
  end
end
