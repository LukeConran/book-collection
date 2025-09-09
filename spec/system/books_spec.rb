require 'rails_helper'

RSpec.describe "Books", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "creates a book when title is present" do
    visit new_book_path

    fill_in "Title", with: "The Hobbit"
    click_button "Create Book"

    expect(page).to have_content("Book was successfully created")
    expect(Book.last.title).to eq("The Hobbit")
  end

  it "shows an error when title is blank" do
    visit new_book_path

    fill_in "Title", with: ""
    click_button "Create Book"

    expect(page).to have_content("Title can't be blank")
  end
end
