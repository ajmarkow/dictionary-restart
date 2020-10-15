require("Word")
require("rspec")

describe ("Word") do
  it("returns an empty array for storing word hashes") do
    expect(Word.all).to(eq([]))
  end
end

describe("save") do
  it("adds a new word to the @@wordcontainer hash") do
    testword2 = Word.new({ :name => "car", :wordid => 2 })
    testword2.save()
    expect(testword2.name).to eq("car")
  end
end

describe("clear") do
  it("clears words") do
    testword = Word.new({ :name => "car", :wordid => 3 })
    Word.clear()
    expect(Word.all).to(eq([]))
  end
end

describe("delete") do
  it("removes a word from the words class variable") do
    testword = Word.new({ :name => "car", :wordid => 2 })
    testword2 = Word.new({ :name => "animal", :wordid => 3 })
    testword.save()
    testword.delete()
    expect(Word.all).to(eq([testword2]))
  end
end

describe("update") do
  it("changes a word") do
    testword = Word.new({ :name => "car", :wordid => 5 })
    testword.update("automobile")
    expect(testword.name).to(eq("automobile"))
  end
end

describe("find") do
  it("returns a specific word") do
    testword6 = Word.new({ :name => "motorcycle", :definition => "a vehicle with two wheels", :wordid => 6 })
    testword7 = Word.new({ :name => "car", :wordid => 7 })
    testword6.save()
    testword7.save()
    expect(Word.find(6)).to(eq(testword6))
  end
end
