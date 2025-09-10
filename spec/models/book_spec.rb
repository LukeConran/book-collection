require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with valid attributes" do
    book = Book.new(title: "The Hobbit", author: "J.R.R. Tolkien", price: 10.99, published_date: Date.today)
    expect(book).to be_valid
  end

  it "is not valid without a title" do
    book = Book.new(title: nil)
    expect(book).not_to be_valid
  end

  it "is not valid without an author" do
    book = Book.new(author: nil)
    expect(book).not_to be_valid
  end

  it "is not valid without a price" do
    book = Book.new(price: nil)
    expect(book).not_to be_valid
  end

  it "is not valid without a published_date" do
    book = Book.new(published_date: nil)
    expect(book).not_to be_valid
  end
end
