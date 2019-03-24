require "rails_helper"

RSpec.describe BookService, "#create_book" do
  it "creates a book" do
    word = build(:biblos)

    BookService.new(word).create_book

    book = Book.find_by_abbreviation "Mat"
    expect(book.greek_title).to eq "ΚΑΤΑ ΜΑΤΘΑΙΟΝ"
    expect(book.name).to eq "Matthew"
    expect(book.transcription).to eq "Kata Maththaion"
    expect(book.title).to eq "According to Matthew"
    expect(book.author).to eq "Matthew"
    expect(book.number).to eq 41
    expect(book.abbreviation).to eq  "Mat"
    expect(book.reference).to eq "41_Mat"
  end
end
