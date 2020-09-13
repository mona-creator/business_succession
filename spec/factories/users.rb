FactoryBot.define do
  factory :user do
    surname {"山田"}
    first_name {"太郎"}
    surname_kana {"ヤマダ"}
    first_name_kana{"タロウ"}
    sequence(:email) { |n| "yamada#{n}@tarou.com"}
    postal_code {"7654321"}
    address {"東京都千代田区1-1-1"}
    phone_number {"08012345678"}
    password {"qazwsx"}
  end
end
