require("sinatra")
require("sinatra/reloader")
require("./lib/Word")
require("./lib/Definition")
require("pry")
also_reload("lib/**/*.rb")

# get("/word/:id/definitions") do
#   "what it does"
# end

# get("/word/:id/definitions/:id") do
#   "what it does"
# end

# get("/word/:id/definitions/new") do
#   "what it does"
# end

# get("/word/:id/definitions/:id/edit") do
#   "what it does"
# end
# ✓
get("/") do
  @words = Word.all
  erb(:new_word)
end
# ✓
get("/words") do
  @words = Word.all
  @word = Word.find(params[:id].to_i)
  erb(:words)
end
# ✓
get("/words/:id") do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
# ✓
get("/words/new/") do
  erb(:new_word)
end
# ✓
get("/words/:id/edit") do
  @word = Word.find(params[:id].to_i)
  erb(:edit_word)
end
# ✓
delete("/words/:id") do
  @word = Word.find(params[:id].to_i())
  @word.delete
  erb(:words)
end

# delete("/word/:id/definitions/:id") do
#   "what it does"
# end
# ✓
post("/words") do
  name = params[:wordname]
  word = Word.new({ :name => name, :id => nil })
  word.save()
  redirect to (:words)
end

post("/word/:id/definitions") do
  @word = Word.find(params[:id.to_i])
  newdefinition = Definition.new ({ :text => params[:definiton - text], :id => nil, :wordid => @word.id })
  newdefinition.save()
  erb(:words)
end

patch("/words/:id") do
  # id = params[:id].to_i
  # @word = Word.find(id)
  @word.update(params[:name])
  @word.save()
  @words = Word.all
  erb(:words)
end

# patch("/word/:id/definitions/:id") do
#   "what it does"
# end
