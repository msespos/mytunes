# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Creating a friendship', type: :feature do
  include Warden::Test::Helpers

  before(:all) do
    @mike = create(:user)
    @katie = create(:user, name: 'Katie', email: 'katie@example.com', project_name: 'Xena')
    @alice = create(:user, name: 'Alice', email: 'alice@example.com', project_name: 'Xena')
  end

  scenario 'successful login displays username' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    expect(page).to have_content('m:ke')
  end

  scenario 'successful friendship request displays confirmation flash' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    first(class: 'potential-friend').click
    expect(page).to have_content('You made a friendship request!')
  end

  scenario 'successful friendship confirmation displays confirmation flash' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    first(class: 'potential-friend').click
    click_on 'Sign out'
    login_as(@katie, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    click_on 'Confirm'
    expect(page).to have_content('You are now friends with m:ke!')
  end

  scenario 'successful friendship denial displays denial flash' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    first(class: 'potential-friend').click
    click_on 'Sign out'
    login_as(@katie, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    click_on 'Deny'
    expect(page).to have_content('You denied the friendship request!')
  end

  scenario "successful friendship creation displays new friend's name" do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    first(class: 'potential-friend').click
    click_on 'Sign out'
    login_as(@katie, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    click_on 'Confirm'
    expect(page).to have_content("Your Friends:\nm:ke")
  end

  scenario "successful friendship request by two users displays users' names to requested user" do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    first(class: 'potential-friend').click
    first(class: 'potential-friend').click
    click_on 'Sign out'
    login_as(@katie, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    first(class: 'potential-friend').click
    click_on 'Sign out'
    login_as(@alice, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    expect(page).to have_content("People Requesting Your Friendship:\nm:ke (blanket forts) Confirm Deny\nKatie")
  end

  scenario 'successful friendship request of two other users displays them in order' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    first(class: 'potential-friend').click
    first(class: 'potential-friend').click
    expect(page).to have_content("You've Requested Their Friendship:\nKatie (Xena)\nAlice (Xena)")
  end

  scenario "successful creation of two friendships displays both friends' names in order" do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    first(class: 'potential-friend').click
    first(class: 'potential-friend').click
    click_on 'Sign out'
    login_as(@katie, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    click_on 'Confirm'
    click_on 'Sign out'
    login_as(@alice, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    click_on 'Confirm'
    click_on 'Sign out'
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    expect(page).to have_content("Your Friends:\nKatie (Xena)\nAlice (Xena)")
  end
end

# rubocop:enable Metrics/BlockLength
