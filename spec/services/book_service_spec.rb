require "rails_helper"

RSpec.describe BookService do
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

  it "populates books, chapters, and verses" do
    words = []
    words << build(:random_word, reference: "41_Mat.001.001")
    words << build(:random_word, reference: "41_Mat.001.002")
    words << build(:random_word, reference: "41_Mat.002.001")
    words << build(:random_word, reference: "41_Mat.002.002")
    words << build(:random_word, reference: "42_Mrk.001.001")
    words << build(:random_word, reference: "42_Mrk.001.002")
    words << build(:random_word, reference: "42_Mrk.001.003")
    words << build(:random_word, reference: "42_Mrk.001.003")
    words << build(:random_word, reference: "43_Luk.001.001")

    allow(Word).to receive(:order).and_return(words)
    #words.each { |word| allow(word).to receive(:save!).and_return(true) }
    BookService.populate

    matthews = Book.where(name: "Matthew")
    marks = Book.where(name: "Mark")
    lukes = Book.where(name: "Luke")
    expect(matthews.count).to eq(1)
    expect(matthews.first.chapters.count).to eq(2)
    expect(marks.count).to eq(1)
    expect(marks.first.chapters.count).to eq(1)
    expect(marks.first.chapters.first.verses.count).to eq(3)
    expect(marks.first.chapters.first.verses.last.words.count).to eq(2)
    expect(words[7].verse).to eq marks.first.chapters.first.verses.last
    expect(words[7].chapter).to eq marks.first.chapters.last
    expect(words[7].book).to eq marks.first
    expect(lukes.first.chapters.count).to eq(1)
    expect(lukes.first.chapters.first.verses.count).to eq(1)
    expect(words[8].verse).to eq lukes.first.chapters.first.verses.first
  end
end
