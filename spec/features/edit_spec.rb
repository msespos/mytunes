# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Editing profile', type: :feature do
  before(:all) do
    @mike = create(:user)
  end

  scenario 'successful signup and profile edit displays user profile page' do
    visit root_path
    click_on 'Sign up'
    fill_in 'Name', with: 'Alicia'
    fill_in 'Email', with: 'alice@example.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    fill_in 'Name', with: 'Alice'
    click_on 'Update'
    expect(page).to have_content("Alice's Profile")
  end

  scenario 'successful profile edit of favorite artists displays new favorite artist' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'm:ke'
    click_on 'Edit Your Profile'
    fill_in 'Favorite artist', with: 'Nirvana'
    click_on 'Update'
    expect(page).to have_content('Favorite artist: Nirvana')
  end
end

# rubocop:enable Metrics/BlockLength
