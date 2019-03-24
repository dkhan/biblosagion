FactoryBot.define do
  factory :chapter do
    sequence :number
    reference { "#{book.reference}.#{number.to_s.rjust(3, "0")}" }
    book
  end
end
