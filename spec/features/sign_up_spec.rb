# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Sign up and edit profile', type: :feature do
  before(:all) do
    @mike = create(:user)
  end

  scenario 'sign up' do
    visit root_path
    click_on 'Sign up'
    fill_in 'Email', with: 'katie@example.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'sign up and update profile' do
    visit root_path
    click_on 'Sign up'
    fill_in 'Email', with: 'alice@example.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    fill_in 'Name', with: 'Alice'
    click_on 'Update User'
    expect(page).to have_content('Logged in as Alice')
  end

  scenario 'sign in and update profile' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Edit Profile'
    fill_in 'Favorite artist', with: 'Nirvana'
    click_on 'Update User'
    click_on 'View Profile'
    expect(page).to have_content('Favorite artist: Nirvana')
  end
end

# rubocop:enable Metrics/BlockLength
