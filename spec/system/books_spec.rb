require 'rails_helper'

RSpec.describe "Books", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "creates a book when all attributes are present" do
    visit new_book_path

    fill_in "Title", with: "The Hobbit"
    fill_in "Author", with: "Tolkien"
    fill_in "Price", with: "12.99"
    fill_in "Published date", with: Date.today

    click_button "Create Book"

    expect(page).to have_content("Book was successfully created")
    expect(Book.last.title).to eq("The Hobbit")
    expect(Book.last.author).to eq("Tolkien")
    expect(Book.last.price).to eq(12.99)
    expect(Book.last.published_date).to eq(Date.today)
  end

  it "shows an error when title is blank" do
    visit new_book_path
    fill_in "Title", with: ""
    fill_in "Author", with: "Tolkien"
    fill_in "Price", with: "12.99"
    fill_in "Published date", with: Date.today
    click_button "Create Book"
    expect(page).to have_content("Title can't be blank")
  end

  it "shows an error when author is blank" do
    visit new_book_path
    fill_in "Title", with: "The Hobbit"
    fill_in "Author", with: ""
    fill_in "Price", with: "12.99"
    fill_in "Published date", with: Date.today
    click_button "Create Book"
    expect(page).to have_content("Author can't be blank")
  end

  it "shows an error when price is blank" do
    visit new_book_path
    fill_in "Title", with: "The Hobbit"
    fill_in "Author", with: "Tolkien"
    fill_in "Price", with: ""
    fill_in "Published date", with: Date.today
    click_button "Create Book"
    expect(page).to have_content("Price can't be blank")
  end

  it "shows an error when published date is blank" do
    visit new_book_path
    fill_in "Title", with: "The Hobbit"
    fill_in "Author", with: "Tolkien"
    fill_in "Price", with: "12.99"
    fill_in "Published date", with: ""
    click_button "Create Book"
    expect(page).to have_content("Published date can't be blank")
  end
end

