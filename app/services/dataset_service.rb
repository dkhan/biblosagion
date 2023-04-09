module DatasetService
  # trancate all tables before reset
  def self.populate
    StrongService.populate
    WordService.populate
    BookService.populate
    CriterionService.populate
    ParagraphService.populate
    TranslationService.populate
  end
end
