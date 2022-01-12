# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Comment on a post', type: :feature do
  before(:all) do
    @mike = create(:user)
    @katie = create(:user, name: 'Katie', email: 'katie@example.com')
  end

  scenario 'log in and create a post and comment on that post' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'text_post[body]', with: 'My Post'
    click_on 'Create Text post'
    expect(page).to have_content('Comment')
  end

  scenario 'log in and create a post and comment on that post' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'text_post[body]', with: 'My Post'
    click_on 'Create Text post'
    fill_in 'comment[body]', with: 'My Comment'
    click_on 'Create Comment'
    expect(page).to have_content('My Comment')
  end

  scenario 'log in and create a post and comment on it and log in as a friend and comment on it' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'text_post[body]', with: 'My Post'
    click_on 'Create Text post'
    fill_in 'comment[body]', with: 'My Second Comment'
    click_on 'Create Comment'
    click_on 'All'
    click_on 'Make'
    click_on 'Sign out'
    fill_in 'Email', with: 'katie@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Pending'
    click_on 'Confirm'
    click_on 'myTunes'
    fill_in 'comment[body]', with: 'My Second Comment'
    click_on 'Create Comment'
    expect(page).to have_content('My Second Comment')
  end
end

# rubocop:enable Metrics/BlockLength
