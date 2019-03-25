FactoryBot.define do
  factory :verse do
    sequence :number
    chapter
    book
    reference { "#{chapter.reference}.#{number.to_s.rjust(3, "0")}" }

    trait :with_words do
      transient do
        number_of_words { 10 }
      end

      after :create do |verse, evaluator|
        create_list(:random_word, evaluator.number_of_words, verse: verse)
      end
    end
  end
end
