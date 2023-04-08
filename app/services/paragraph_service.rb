class ParagraphService
  def ParagraphService.populate(dry_run = true)
    path = File.join(Rails.root, "datasets", "leb_nt_edited.txt")
    heading_number = 0
    book_number = 40
    book = nil
    chapter_number = 1
    chapter = nil
    verse_number = 0
    paragraph = nil
    
    File.readlines(path).each do |line|
      next if line.blank?

      # name of the book - all caps
      unless line.match /[a-z]/
        unless book_number == 40 || book.chapters.count == 1
          puts "1. end_verse.number: #{chapter.verses.last.number}"
          paragraph.update_attribute(:end_verse_id, chapter.verses.last.id) unless dry_run
        end
        book = Book.find_by_number(book_number += 1)
        chapter_number = 1
        chapter = Chapter.find_by_book_id_and_number(book, chapter_number)
        verse_number = 0
        next
      end

      if line == headings[heading_number]
        chapter = Chapter.find_by_book_id_and_number(book, chapter_number)
        unless verse_number.zero?
          puts "2. end_verse.number: #{verse_number}"
          end_verse = Verse.find_by_chapter_id_and_number(chapter, verse_number)
          paragraph.update_attribute(:end_verse_id, end_verse.id) unless dry_run
        end

        start_verse = Verse.find_by_chapter_id_and_number(chapter, verse_number += 1)
        puts "#{line} #{book.name} #{chapter.number}:#{start_verse.number}"
        paragraph = Paragraph.create!(
          header: line,
          book: book,
          chapter: chapter,
          start_verse_id: start_verse.id
          ) unless dry_run
        heading_number += 1
      end

      if line.match /([\d]+) [^\d]*$/
        verse_number = $1.to_i
      end

      # end of chapter
      if verse_number == chapter.verses.last.number
        puts "3. end_verse.number: #{chapter.verses.last.number}"
        paragraph.update_attribute(:end_verse_id, chapter.verses.last.id) unless dry_run
        if chapter_number == book.chapters.count
          chapter_number = 1
        else
          chapter_number += 1
        end
        verse_number = 0
      end
    end
    nil
  end

  def self.headings
    headings = []
    path = File.join(Rails.root, "datasets", "paragraph_headings.txt")
    File.readlines(path).each do |line|
      headings << line
    end
    headings
  end
end
