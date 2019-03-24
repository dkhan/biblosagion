FactoryBot.define do
  factory :strong do
    sequence :strong_number do
      "G#{rand 1000..7000}"
    end
  end
end
