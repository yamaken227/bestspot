FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { 'abc123abc' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
  end
end