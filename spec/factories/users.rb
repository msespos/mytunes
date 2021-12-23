# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

FactoryBot.define do
  factory :user do
    email { 'mike@example.com' }
    password { '123456' }
    name { 'm:ke' }
    project_name { 'blanket forts' }
    location { 'Lomita, CA' }
    favorite_artist { 'Autechre' }
    birthday { '07/08/1975' }
  end
end

# rubocop:enable Metrics/BlockLength
