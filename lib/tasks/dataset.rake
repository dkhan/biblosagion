namespace :dataset do
  desc "Populate all data"
  task strongs: :environment do
    DatasetService.populate
  end

  desc "Populate strong concordance from the tsv"
  task strongs: :environment do
    StrongService.populate
  end

  desc "Populate Greek bible from the tsv"
  task words: :environment do
    WordService.populate
  end

  desc "Populate books"
  task books: :environment do
    BookService.populate
  end

  desc "Populate paragraphs"
  task paragraphs: :environment do
    ParagraphService.populate(false)
  end

  desc "Populate criteria"
  task criteria: :environment do
    CriterionService.populate
  end

  desc "Populate translations"
  task translations: :environment do
    TranslationService.populate
  end
end
