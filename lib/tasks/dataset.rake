namespace :dataset do
  desc "Populate strong concordance from the tsv"
  task strongs: :environment do
    StrongService.populate
  end

  desc "Populate Greek bible from the tsv"
  task words: :environment do
  end

end
