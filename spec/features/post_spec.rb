# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe 'Creating a post', type: :feature do
  before(:all) do
    @mike = create(:user)
    @katie = create(:user, name: 'Katie', email: 'katie@example.com')
  end

  scenario 'successful navigation to text post from navbar displays text post' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'New Post'
    expect(page).to have_content "Sign out\nCreate a Text Post"
  end

  scenario 'successful text post creation displays post' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'text_post[body]', with: 'My Post'
    click_on 'Submit'
    expect(page).to have_content('My Post')
  end

  scenario 'successful text post creation displays confirmation flash' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'text_post[body]', with: 'My Post'
    click_on 'Submit'
    expect(page).to have_content('Post created!')
  end

  scenario "successful text post creation displays post creator's name" do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'text_post[body]', with: 'My Post'
    click_on 'Submit'
    expect(page).to have_content('m:ke')
  end

  scenario 'successful navigation to image post from text post displays image post' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'New Post'
    click_on 'Create an image post instead'
    expect(page).to have_content "Sign out\nCreate an Image Post"
  end

  scenario 'successful navigation to audio post from text post displays audio post' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'New Post'
    click_on 'Create an audio post instead'
    expect(page).to have_content "Sign out\nCreate an Audio Post"
  end

  scenario 'successful navigation to text post from image post displays text post' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'New Post'
    click_on 'Create an image post instead'
    click_on 'Create a text post instead'
    expect(page).to have_content "Sign out\nCreate a Text Post"
  end

  scenario 'successful navigation to audio post from image post displays audio post' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'New Post'
    click_on 'Create an image post instead'
    click_on 'Create an audio post instead'
    expect(page).to have_content "Sign out\nCreate an Audio Post"
  end

  scenario 'successful navigation to text post from audio post displays text post' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'New Post'
    click_on 'Create an audio post instead'
    click_on 'Create a text post instead'
    expect(page).to have_content "Sign out\nCreate a Text Post"
  end

  scenario 'successful navigation to image post from audio post displays image post' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'New Post'
    click_on 'Create an audio post instead'
    click_on 'Create an image post instead'
    expect(page).to have_content "Sign out\nCreate an Image Post"
  end
end

# rubocop:enable Metrics/BlockLength
