# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Liking a post', type: :feature do
  before(:all) do
    @mike = create(:user)
    @katie = create(:user, name: 'Katie', email: 'katie@example.com')
  end

  scenario 'successful log in and post creation and post liking' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'text_post[body]', with: 'My Post'
    click_on 'Submit'
    click_on 'Like this post'
    expect(page).to have_content('1 Like')
  end

  scenario 'successful log in and post creation and post liking as two different users' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'text_post[body]', with: 'My Post'
    click_on 'Submit'
    click_on 'Like this post'
    click_on 'Everybody'
    click_on '+Friend'
    click_on 'Sign out'
    fill_in 'Email', with: 'katie@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Everybody'
    click_on 'Confirm'
    first(:xpath, "//a[contains(@href, '/posts')]").click
    click_on 'Like this post'
    expect(page).to have_content('2 Likes')
  end
end

# rubocop:enable Metrics/BlockLength
