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

  it "creates a chapter" do
    word = build(:random_word, reference: "42_Mrk.016.018")

    service = BookService.new(word)
    service.create_book
    service.create_chapter

    chapter = Chapter.find_by_reference("42_Mrk.016")
    expect(chapter.book.name).to eq "Mark"
    expect(chapter.number).to eq 16
  end

  it "creates a verse" do
    word = build(:random_word, reference: "41_Mat.002.010")

    service = BookService.new(word)
    service.create_book
    service.create_chapter
    service.create_verse

    verse = Verse.find_by_reference("41_Mat.002.010")
    expect(verse.book.name).to eq "Matthew"
    expect(verse.chapter.number).to eq 2
    expect(verse.number).to eq 10
  end
end
