require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

feature "root path", type: :feature do
  it("creates a word") do
    visit("/")
    fill_in("wordname", :with => "Freddie")
    click_on("Add your word!")
    expect(page).to have_content ("Freddie")
  end
end

feature "words list path", type: :feature do
  it("displays a list of all words") do
    visit("/")
    fill_in("wordname", :with => "Dog")
    click_on("Add your word!")
    visit("/")
    fill_in("wordname", :with => "Judith")
    click_on("Add your word!")
    visit("/")
    fill_in("wordname", :with => "AJ")
    click_on("Add your word!")
    expect(page).to have_content ("Freddie")
    expect(page).to have_content ("Judith")
    expect(page).to have_content ("AJ")
  end
end

feature "inidividual word path", type: :feature do
  it("shows a word and the edit options") do
    visit("/words")
    click_on("Dog")
    expect(page).to have_content ("Dog")
  end
end

feature "delete word path", type: :feature do
  it("deletes a word") do
    visit("/words")
    click_on("Dog")
    click_on("Delete Dog")
    visit("/words")
    expect(page).not_to have_content ("Dog")
  end
end

feature "update word path", type: :feature do
  it("updates a word") do
    visit("/")
    fill_in("wordname", :with => "Dog")
    click_on("Add your word!")
    visit("/words")
    click_on("Dog")
    fill_in("name", :with => "FREDDIEBOY")
    click_on("Update Dog")
    visit("/words")
    expect(page).to have_content ("FREDDIEBOY")
  end
end

feature "delete definition path", type: :feature do
  it("adds a definition") do
    visit("/")
    fill_in("wordname", :with => "Dog")
    click_on("Add your word!")
   visit("/words")
    click_on("Dog")
    fill_in("definitiontext", :with => "fluffyboye")
    click_on("Add definition")
    expect(page).to have_content ("fluffyboye")
  end
end
