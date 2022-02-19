# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Commenting on a post', type: :feature do
  before(:all) do
    @mike = create(:user)
    @katie = create(:user, name: 'Katie', email: 'katie@example.com')
  end

  scenario 'successful comment on a post displays the comment' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'text_post[body]', with: 'My Post'
    click_on 'Submit'
    fill_in 'comment[body]', with: 'My Comment'
    click_on 'Post a comment'
    expect(page).to have_content('My Comment')
  end

  scenario 'successful comment by a friend of original poster displays comment' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'text_post[body]', with: 'My Post'
    click_on 'Submit'
    click_on 'Everybody'
    click_on '+Friend'
    click_on 'Sign out'
    fill_in 'Email', with: 'katie@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Everybody'
    click_on 'Confirm'
    first(:xpath, "//a[contains(@href, '/posts')]").click
    fill_in 'comment_body', with: 'My Comment'
    click_on 'Post a comment'
    expect(page).to have_content('My Comment')
  end
end

# rubocop:enable Metrics/BlockLength
