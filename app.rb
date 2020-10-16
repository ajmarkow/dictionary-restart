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
  erb(:words)
end
# ✓
get("/words/:id") do
  @word = Word.find(params[:id].to_i())
  @definitions = Definition.verbosefind(@word.id)
  erb(:edit_word)
end

get("/definitions/:id") do
  @definition = Definition.find(params[:id].to_i)
  # @definition = @definitions.find(params[:id].to_i).to_s
  binding.pry
  erb(:definition)
end
# ✓
get("/words/new") do
  redirect to ("/")
end
# ✓
get("/words/:id/edit") do
  # @words = Word.all
  @word = Word.find(params[:id].to_i)
  erb(:edit_word)
end
# ✓
delete("/words/:id") do
  @word = Word.find(params[:id].to_i())
  @word.delete
  redirect to(:words)
end

# delete("/word/:id/definitions/:id") do
#   "what it does"
# end
# ✓
post("/words") do
  name = params[:wordname]
  @word = Word.new({ :name => name, :id => nil })
  @word.save()
  redirect to (:words)
end

get ("/words/:id/definitions") do
  @word = Word.find(params[:id].to_i)
  erb(:definitions)
end

post("/words/:id/definitions") do
  @word = Word.find(params[:id].to_i)
  text = params[:definition].to_s
  newdefinition = Definition.new ({ :text => "#{text}", :id => nil, :wordid => @word.id })
  newdefinition.save()
  @words = Word.all
  erb(:words)
end

patch("/words/:id") do
  id = params[:id].to_i
  @word = Word.find(id)
  @word.update(params[:name])
  @word.save()
  @words = Word.all
  erb(:words)
end

# patch("/word/:id/definitions/:id") do
#   "what it does"
# end
