# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Create a friendship', type: :feature do
  before(:all) do
    @mike = create(:user)
    @katie = create(:user, name: 'Katie', email: 'katie@example.com')
  end

  scenario 'log in' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    expect(page).to have_content('Logged in as m:ke')
  end

  scenario 'log in and request a friendship' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Make Friend Request'
    expect(page).to have_content('You made a friendship request!')
  end

  scenario 'log in and request a friendship, log in as other user and confirm request' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Make Friend Request'
    click_on 'Sign out'
    fill_in 'Email', with: 'katie@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Pending Friend Requests'
    click_on 'Confirm'
    expect(page).to have_content('You confirmed the friendship!')
  end

  scenario 'log in and request a friendship, log in as other user and confirm request' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Make Friend Request'
    click_on 'Sign out'
    fill_in 'Email', with: 'katie@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Pending Friend Requests'
    click_on 'Confirm'
    expect(page).to_not have_content('Make Friend Request')
  end

  scenario 'log in and request a friendship, log in as other user and deny request' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Make Friend Request'
    click_on 'Sign out'
    fill_in 'Email', with: 'katie@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Pending Friend Requests'
    click_on 'Deny'
    expect(page).to have_content('You denied the friendship request!')
  end

  scenario 'log in and request a friendship, log in as other user and deny request' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Make Friend Request'
    click_on 'Sign out'
    fill_in 'Email', with: 'katie@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Pending Friend Requests'
    click_on 'Deny'
    expect(page).to have_content('No Pending Friend Requests')
  end
end

# rubocop:enable Metrics/BlockLength
