class BookService
  attr_accessor :book, :chapter, :verse, :word
  attr_accessor :book_number, :book_abbreviation, :chapter_number, :verse_number

  def initialize(word)
    @word = word
    @word.reference.match /([\d]{2})_(.*{3})\.([\d]{3})\.([\d]{3})/
    @book_number = $1.to_i
    @book_abbreviation = $2
    @chapter_number = $3.to_i
    @verse_number = $4.to_i
  end

  def BookService.populate
    current_book = nil
    current_chapter = nil
    current_verse = nil
    Word.order(:testament_position).each do |word|
      puts word.reference
      service = new(word)
      service.book = current_book
      if current_book.try(:number) != service.book_number
        current_book = service.create_book
      end

      service.chapter = current_chapter
      if current_chapter.try(:number) != service.chapter_number || current_book.try(:number) != service.book_number
        current_chapter = service.create_chapter
      end

      service.verse = current_verse
      if current_book.try(:number) != service.book_number || current_chapter.try(:number) != service.chapter_number || current_verse.try(:number) != service.verse_number
        current_verse = service.create_verse
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
    @chapter = Chapter.create! number: chapter_number,
                               reference: "#{book.reference}.#{chapter_number}",
                               book: book
  end

  def create_verse
    @verse = Verse.create! number: verse_number,
                           reference: word.reference,
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
