module DatasetService
  def self.populate
    StrongService.populate
    WordService.populate
    BookService.populate
    CriterionService.populate
    ParagraphService.populate

    create_missing_verses
    
    TranslationService.populate
  end

  def self.create_missing_verses
    [
      { reference: "43_Jhn.005.004", book: "John", chapter: 5,  verse: 4 },
      { reference: "44_Act.015.034", book: "Acts", chapter: 15, verse: 34 },
    ].each do |v|
      book = Book.find_by_name(v[:book])
      chapter = Chapter.find_by_book_id_and_number(book.id, v[:chapter])
      Verse.create!(
        reference: v[:reference],
        book_id: book.id,
        chapter_id: chapter.id,
        number: v[:verse])
    end
  end
end
