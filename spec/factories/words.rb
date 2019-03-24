FactoryBot.define do
  sequence :abrakadabra do
    ('α'..'ω').to_a.sample(rand 1..10).join
  end

  factory :word do
    sequence :testament_position { |n| n }
    formatted_greek: { "Βίβλος" }
    lexical_form: { "βίβλος" }
    normalized_greek: { "βιβλος" }
    reference: { verse.reference }
    strong_number: { strong.strong_number }

    book_position: { nil }
    verse_position: { nil }
    chapter_position: { nil }
    strong
    book
    chapter
    verse

    factory :random_word do
      normalized_greek: { generate(:abrakadabra) }
      formatted_greek: { normalized_greek }
      lexical_form: { normalized_greek }
    end
  end
end
