FactoryBot.define do
  sequence :abrakadabra do
    ('α'..'ω').to_a.sample(rand 1..10).join
  end

  factory :word do
    verse
    sequence :testament_position
    reference { verse.reference }
    strong_number { strong.strong_number }

    association :strong,
      greek: lexical_form,
      normalized_greek: lexical_form
  end

  factory :random_word, parent: :word do
    normalized_greek { generate(:abrakadabra) }
    formatted_greek { normalized_greek }
    lexical_form { normalized_greek }
  end

  factory :biblos, parent: :word do
    formatted_greek { "Βίβλος" }
    lexical_form { "βίβλος" }
    normalized_greek { "βιβλος" }
  end
end
