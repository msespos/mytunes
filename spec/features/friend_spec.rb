# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Create a friendship', type: :feature do
  before(:all) do
    @mike = create(:user)
  end

  scenario 'log in' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    expect(page).to have_content('Logged in as m:ke')
  end
end

# rubocop:enable Metrics/BlockLength
