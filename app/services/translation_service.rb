class TranslationService
  require 'rexml/document'
  include REXML

  def self.populate
    xml = File.join(Rails.root, "datasets", "Bible_English_ESV.xml")
    xmlfile = File.new(xml)
    xmldoc = Document.new(xmlfile)
    
    xmldoc.root.elements.each("BIBLEBOOK") do |b|
      next if b.attributes["bnumber"].to_i < 40

      puts "Book " + b.attributes["bnumber"] + ": " + b.attributes["bname"]
      book = Book.find_by_number(b.attributes["bnumber"])
      b.elements.each("CHAPTER") do |c|
        puts "Chapter: " + c.attributes["cnumber"]
        chapter = Chapter.find_by_book_id_and_number(book.id, c.attributes["cnumber"])
        c.elements.each("VERS") do |v|
          puts v.attributes["vnumber"] + ": " + v.text
          verse = Verse.find_by_chapter_id_and_number(chapter.id, v.attributes["vnumber"])
          if verse.present?
            puts verse.reference
            Translation.create!(
              version: "ESV",
              reference: verse.reference,
              book_id: book.id,
              chapter_id: chapter.id,
              verse_id: verse.id,
              description: nil,
              text: v.text)
          else
            puts "NO VERSE!!!"
          end
        end
      end
    end
  end
end
