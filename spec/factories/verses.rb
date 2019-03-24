FactoryBot.define do
  factory :verse do
    sequence :number { |n| n }
    reference { "#{chapter.reference}.#{number.to_s.rjust(3, "0")}" }
    chapter

    trait :with_words do
      transient do
        number_of_words 10
      end

      after :create do |verse, evaluator|
        evaluator.number_of_words.times do
          verse.words << create(:random_word)
        end
      end
    end
  end
end
