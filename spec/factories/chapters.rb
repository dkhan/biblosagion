FactoryBot.define do
  factory :chapter do
    sequence :number { |n| n }
    reference { "#{book.reference}.#{number.to_s.rjust(3, "0")}" }
    book
  end
end
