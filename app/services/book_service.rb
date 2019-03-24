class BookService
  attr_accessor :book, :chapter, :verse, :word
  attr_accessor :book_number, :book_abbreviation, :chapter_number, :verse_number

  def initialize(word)
    @word = word
    @word.reference.match /([\d]{2})_(.*{3})\.([\d]{3})\.([\d]{3})/
    @book_number = $1.to_i
    @book_abbreviation = $2
    @chapter_number = $3
    @verse_number = $3
  end

  def BookService.populate
    current_book = nil
    current_chapter = nil
    current_verse = nil
    current_reference = nil
    Word.order(:testament_position).find_each do |word|
      service = new(word)

      unless current_book == service.book
        service.create_book
        current_book = service.book
      end

      unless current_chapter == service.chapter && current_book == service.book
        service.create_chapter
        current_chapter = service.chapter
      end

      unless current_reference == service.reference
        service.create_verse
        current_verse = service.verse
        current_reference = service.reference
      end

      service.update_word
    end
  end

  def create_book
    @book = Book.create! greek_title:   Constants::BOOKS[book_abbreviation][0],
                         name:          Constants::BOOKS[book_abbreviation][1],
                         transcription: Constants::BOOKS[book_abbreviation][2],
                         title:         Constants::BOOKS[book_abbreviation][3],
                         author:        Constants::BOOKS[book_abbreviation][4],
                         number:        book_number,
                         abbreviation:  book_abbreviation,
                         reference:     "#{book_number}_#{book_abbreviation}"
  end

  def create_chapter
    @chapter = Chapter.create! number: chapter_number.to_i,
                               reference: "#{book.reference}.#{chapter_number}",
                               book: book
  end

  def create_verse
    @verse = Verse.create! number: verse_number.to_i,
                           reference: reference,
                           book: book,
                           chapter: chapter
  end

  def update_word
    word.book = book
    word.chapter = chapter
    word.verse = verse
    word.save!
  end
end
