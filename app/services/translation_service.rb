class TranslationService
  require 'rexml/document'
  include REXML

  attr_accessor :xml

  def initialize(filename = "Bible_English_ESV.xml")
    @xml = File.join(Rails.root, "datasets", filename)
  end

  def self.populate
    xmlroot.elements.each("BIBLEBOOK") do |book|
      puts "Book " + book.attributes["bnumber"] + ": " + book.attributes["bname"]
      # book.elements.each("CHAPTER") do |chapter|
      #   puts "Chapter: " + chapter.attributes["cnumber"]
      #   chapter.elements.each("VERS") do |verse|
      #     puts verse.attributes["vnumber"] + ": " + verse.text
          
      #   end
      # end
    end
  end

  def xmlroot
    xmlfile = File.new(xml)
    xmldoc = Document.new(xmlfile)
    xmldoc.root
  end
end
