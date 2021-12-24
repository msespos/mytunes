# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Create a post', type: :feature do
  before(:all) do
    @mike = create(:user)
    @katie = create(:user, name: 'Katie', email: 'katie@example.com')
  end

  scenario 'log in and create a post' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'post[body]', with: 'My Post'
    click_on 'Create Post'
    expect(page).to have_content('My Post')
  end

  scenario 'log in and create a post' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'post[body]', with: 'My Post'
    click_on 'Create Post'
    expect(page).to have_content('Post created!')
  end

  scenario 'log in and create a post' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'post[body]', with: 'My Post'
    click_on 'Create Post'
    expect(page).to have_content('m:ke')
  end
end

# rubocop:enable Metrics/BlockLength
