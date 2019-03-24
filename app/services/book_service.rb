class BookService
  attr_accessor :book, :chapter, :verse, :word
  attr_accessor :book_number, :book_abbreviation, :chapter_number, :verse_number

  BOOKS = [
    { "Mat" => [ "ΚΑΤΑ ΜΑΤΘΑΙΟΝ", "Matthew", "Kata Maththaion", "According to Matthew"] },
    { "Mrk" => [ "ΚΑΤΑ ΜΑΡΚΟΝ", "Mark", "Kata Markon", "According to Mark"] },
    { "Luk" => [ "ΚΑΤΑ ΛΟΥΚΑΝ", "Luke", "Kata Loukan", "According to Luke"] },
    { "Jhn" => [ "ΚΑΤΑ ΙΩΑΝΝΗΝ", "John", "Kata Ioannen", "According to John"] },
    { "Act" => [ "ΠΡΑΞΕΙΣ ΤΩΝ ΑΠΟΣΤΟΛΩΝ", "Acts", "Praxeis Apostolon", "Acts or Deeds of Apostles"] },
    { "Rom" => [ "ΠΡΟΣ ΡΩΜΑΙΟΥΣ", "Romans", "Pros Romaious", "To the Romans"] },
    { "1Co" => [ "ΠΡΟΣ ΚΟΡΙΝΘΙΟΥΣ Α", "1 Corinthians", "Pros Korinthious a", "First (letter) to the Corinthians"] },
    { "2Co" => [ "ΠΡΟΣ ΚΟΡΙΝΘΙΟΥΣ Β", "2 Corinthians", "Pros Korinthious b", "Second (letter) to the Corinthians"] },
    { "Gal" => [ "ΠΡΟΣ ΓΑΛΑΤΑΣ", "Galatians", "Pros Galatas", "To the Galatians"] },
    { "Eph" => [ "ΠΡΟΣ ΕΦΕΣΙΟΥΣ", "Ephesians", "Pros Ephesious", "To the Ephesians"] },
    { "Php" => [ "ΠΡΟΣ ΦΙΛΙΠΠΗΣΙΟΥΣ", "Philippians", "Pros Philippesious", "To the Philippians"] },
    { "Col" => [ "ΠΡΟΣ ΚΟΛΟΣΣΑΕΙΣ", "Colossians", "Pros Kolossaeis", "To the Colossians"] },
    { "1Th" => [ "ΠΡΟΣ ΘΕΣΣΑΛΟΝΙΚΕΙΣ Α", "1 Thessalonians", "Pros Thessalonikeis a", "First (letter) to the Thessalonians"] },
    { "2Th" => [ "ΠΡΟΣ ΘΕΣΣΑΛΟΝΙΚΕΙΣ Β", "2 Thessalonians", "Pros Thessalonikeis b", "Second (letter) to the Thessalonians"] },
    { "1Ti" => [ "ΠΡΟΣ ΤΙΜΟΘΕΟΝ Α", "1 Timothy", "Pros Timotheon a", "First (letter) to Timothy"] },
    { "2Ti" => [ "ΠΡΟΣ ΤΙΜΟΘΕΟΝ Β", "2 Timothy", "Pros Timotheon b", "Second (letter) to Timothy"] },
    { "Tit" => [ "ΠΡΟΣ ΤΙΤΟΝ", "Titus", "Pros Titon", "To Titus"] },
    { "Phm" => [ "ΠΡΟΣ ΦΙΛΗΜΟΝΑ", "Philemon", "Pros Philemona", "To Philemon"] },
    { "Heb" => [ "ΠΡΟΣ ΕΒΡΑΙΟΥΣ", "Hebrews", "Pros Hebraious", "To the Hebrews"] },
    { "Jas" => [ "ΙΑΚΩΒΟΥ", "James", "lakdbou", "Of James"] },
    { "1Pe" => [ "ΠΕΤΡΟΥ Α", "1 Peter", "Petrou a", "First (letter) of Peter"] },
    { "2Pe" => [ "ΠΕΤΡΟΥ Β", "2 Peter", "Petrou b", "Second (letter) of Peter"] },
    { "1Jn" => [ "ΙΩΑΝΝΟΥ Α", "1 John", "Ioannou a", "First (letter) of John"] },
    { "2Jn" => [ "ΙΩΑΝΝΟΥ Β", "2 John", "Ioannou b", "Second (letter) of John"] },
    { "3Jn" => [ "ΙΩΑΝΝΟΥ Γ", "3 John", "Ioannou g", "Third (letter) of John"] },
    { "Jud" => [ "ΙΟΥΔΑ", "Jude", "louda", "Jude"] },
    { "Rev" => [ "ΑΠΟΚΑΛΥΨΙΣ ΙΩΑΝΝΟΥ", "Revelation", "Apokalypsis Ioannou", "Revelation of John"] }
  ]

  def initialize(word)
    @word = word
    @word.reference.match /([\d]{2})_(.*{3})\.([\d]{3})\.([\d]{3})/
    @book_number = $1
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
    @book = Book.create! number: book_number,
                         name: BOOKS[book_abbreviation][1],
                         abbreviation: book_abbreviation,
                         number: book_number,
                         reference: "#{book_number}_#{abbreviation}"
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
