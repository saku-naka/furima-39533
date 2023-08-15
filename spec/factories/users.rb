FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nick_name              {Faker::Games::Pokemon.name}
    email                  {Faker::Internet.email}
    password               {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation  {password}
    last_name              {person.last.kanji}
    first_name             {person.first.kanji}
    read_last              {person.last.katakana}
    read_first             {person.first.katakana}
    birthday               {Faker::Date.birthday}
  end
end
