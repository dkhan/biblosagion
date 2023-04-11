module DatasetService
  def self.populate
    StrongService.populate
    CriterionService.populate
    WordService.populate
    BookService.populate
    ParagraphService.populate

    create_missing_verses
    create_missing_words
    
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

  def self.create_missing_words
    [
      { reference: "41_Mrk.016.017",
        testament_position: 366891,
        strong_number: "G0190",
        editions: "P",
        interlinear: "will follow",
        formatted_greek: "ακολουθήσει",
        normalized_greek: "ακολουθησει",
        morphology: "V-FAI-3S",
        lexical_form: "ακολουθέω",
        meaning: "to follow",
        sub_meaning: "=to follow"
      },
    ].each do |attrs|
      save_word(attrs)
    end

    Word.where(normalized_greek: 'κακεινοι').each do |w|
      [
        { reference: w.reference,
          testament_position: w.testament_position + 1,
          strong_number: "G2532",
          editions: "P",
          interlinear: "and",
          formatted_greek: "κα᾽",
          normalized_greek: "κα᾽",
          morphology: "CONJ",
          lexical_form: "καὶ",
          meaning: "and",
          sub_meaning: "=and"
        },
        { reference: w.reference,
          testament_position: w.testament_position + 2,
          strong_number: "G1565",
          editions: "P",
          interlinear: "they",
          formatted_greek: "᾽κεῖνοι",
          normalized_greek: "᾽κεινοι",
          morphology: "CONJ",
          lexical_form: "ἐκεῖνοι",
          meaning: "that",
          sub_meaning: "=that"
        }
      ].each do |attrs|
        save_word(attrs)
      end
      w.update_attribute(:editions, w.editions + "P-")
    end

    Word.where(normalized_greek: 'καν').each do |w|
      [
        { reference: w.reference,
          testament_position: w.testament_position + 1,
          strong_number: "G2532",
          editions: "P",
          interlinear: "and",
          formatted_greek: "κα᾽",
          normalized_greek: "κα᾽",
          morphology: "CONJ",
          lexical_form: "καὶ",
          meaning: "and",
          sub_meaning: "=and"
        },
        { reference: w.reference,
          testament_position: w.testament_position + 2,
          strong_number: "G0302",
          editions: "P",
          interlinear: "if",
          formatted_greek: "᾽ν",
          normalized_greek: "᾽ν",
          morphology: "PRT",
          lexical_form: "ἂν",
          meaning: "if",
          sub_meaning: "=if"
        }
      ].each do |attrs|
        save_word(attrs)
      end
      w.update_attribute(:editions, w.editions + "P-")
    end
  end

  def self.save_word(attrs)
    word = Word.new(attrs)
    verse = Verse.find_by_reference(word.reference)
    word.verse_id = verse.id
    word.chapter_id = verse.chapter_id
    word.book_id = verse.book_id
    word.save(validate: false)
  end
end
