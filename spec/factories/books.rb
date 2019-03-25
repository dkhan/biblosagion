FactoryBot.define do
  factory :book do
    number { 41 }
    name { "Matthew" }
    abbreviation { "Mat" }
    reference { "#{number}_#{abbreviation}" }
  end

  factory :mark, parent: :book do
    number { 4 }
    name { "Mark" }
    abbreviation { "Mrk" }
  end
end
