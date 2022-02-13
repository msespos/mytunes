# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'mike@example.com' }
    password { '123456' }
    name { 'm:ke' }
    project_name { 'blanket forts' }
    location { 'Lomita, CA' }
    favorite_artist { 'Autechre' }
    birthday { '1975-08-07' }
  end
end
