require 'rails_helper'

RSpec.describe "Books", type: :system do
  before do
    driven_by(:rack_test)
  end

  def select_date(date, options = {})
    select date.year.to_s,  from: "book_published_date_1i"
    select date.strftime("%B"), from: "book_published_date_2i"
    select date.day.to_s,   from: "book_published_date_3i"
  end

  it "creates a book when all attributes are present" do
    visit new_book_path

    fill_in "Title", with: "The Hobbit"
    fill_in "Author", with: "Tolkien"
    fill_in "Price", with: "12.99"
    select_date Date.today

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
    select_date Date.today
    click_button "Create Book"
    expect(page).to have_content("Title can't be blank")
  end

  it "shows an error when author is blank" do
    visit new_book_path
    fill_in "Title", with: "The Hobbit"
    fill_in "Author", with: ""
    fill_in "Price", with: "12.99"
    select_date Date.today
    click_button "Create Book"
    expect(page).to have_content("Author can't be blank")
  end

  it "shows an error when price is blank" do
    visit new_book_path
    fill_in "Title", with: "The Hobbit"
    fill_in "Author", with: "Tolkien"
    fill_in "Price", with: ""
    select_date Date.today
    click_button "Create Book"
    expect(page).to have_content("Price can't be blank")
  end

  it "shows an error when published date is blank" do
    visit new_book_path
    fill_in "Title", with: "The Hobbit"
    fill_in "Author", with: "Tolkien"
    fill_in "Price", with: "12.99"
    click_button "Create Book"
    expect(page).to have_content("Published date can't be blank")
  end
end