FactoryBot.define do
  factory :chapter do
    sequence :number
    book
    reference { "#{book.reference}.#{number.to_s.rjust(3, "0")}" }
  end
end
