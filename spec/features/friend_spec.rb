# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Creating a friendship', type: :feature do
  before(:all) do
    @mike = create(:user)
    @katie = create(:user, name: 'Katie', email: 'katie@example.com')
  end

  scenario 'successful login displays username' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    expect(page).to have_content('m:ke')
  end

  scenario 'successful friendship request displays confirmation flash' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Everybody'
    click_on '+Friend'
    expect(page).to have_content('You made a friendship request!')
  end

  scenario 'successful friendship confirmation displays confirmation flash' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Everybody'
    click_on '+Friend'
    click_on 'Sign out'
    fill_in 'Email', with: 'katie@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Everybody'
    click_on 'Confirm'
    expect(page).to have_content('You confirmed the friendship!')
  end

  scenario 'successful friendship denial displays denial flash' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Everybody'
    click_on '+Friend'
    click_on 'Sign out'
    fill_in 'Email', with: 'katie@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Everybody'
    click_on 'Deny'
    expect(page).to have_content('You denied the friendship request!')
  end

  scenario "successful friendship creation displays new friend's name" do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Everybody'
    click_on '+Friend'
    click_on 'Sign out'
    fill_in 'Email', with: 'katie@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Everybody'
    click_on 'Confirm'
    expect(page).to have_content("m:ke")
  end
end

# rubocop:enable Metrics/BlockLength
