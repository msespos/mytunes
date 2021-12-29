# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Like a post', type: :feature do
  before(:all) do
    @mike = create(:user)
    @katie = create(:user, name: 'Katie', email: 'katie@example.com')
  end

  scenario 'log in and create a post and like that post' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'post[body]', with: 'My Post'
    click_on 'Create Post'
    expect(page).to have_content('Like')
  end

  scenario 'log in and create a post and like that post' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'post[body]', with: 'My Post'
    click_on 'Create Post'
    click_on 'Like'
    expect(page).to have_content('1 Like')
  end

  scenario 'log in and create a post and like it and log in as a friend and like it' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'post[body]', with: 'My Post'
    click_on 'Create Post'
    click_on 'Like'
    click_on 'All'
    click_on 'Make'
    click_on 'Sign out'
    fill_in 'Email', with: 'katie@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Pending'
    click_on 'Confirm'
    click_on 'myTunes'
    click_on 'Like'
    expect(page).to have_content('2 Likes')
  end
end

# rubocop:enable Metrics/BlockLength
