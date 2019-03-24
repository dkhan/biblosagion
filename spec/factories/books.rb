FactoryBot.define do
  factory :book do
    number: { 41 }
    name: { "Matthew" }
    abbreviation: { "Mat" }
    reference: { "#{number}_#{abbreviation}" }
  end
end
