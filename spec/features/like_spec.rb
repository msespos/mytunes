# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Liking a post', type: :feature do
  include Warden::Test::Helpers

  before(:all) do
    @mike = create(:user)
    @katie = create(:user, name: 'Katie', email: 'katie@example.com')
  end

  scenario 'successful post liking displays one like' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'text_post[body]', with: 'My Post'
    click_on 'Submit'
    click_on 'Like this post'
    expect(page).to have_content('1 Like')
  end

  scenario 'successful post liking by two different users displays two likes' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'text_post[body]', with: 'My Post'
    click_on 'Submit'
    click_on 'Like this post'
    click_on 'Everybody'
    click_on '+Friend'
    click_on 'Sign out'
    login_as(@katie, scope: :user)
    click_on 'Log in'
    click_on 'Everybody'
    click_on 'Confirm'
    first(:xpath, "//a[contains(@href, '/posts')]").click
    click_on 'Like this post'
    expect(page).to have_content('2 Likes')
  end

  scenario 'successful post liking and unliking displays zero likes' do
    visit root_path
    login_as(@mike, scope: :user)
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'text_post[body]', with: 'My Post'
    click_on 'Submit'
    click_on 'Like this post'
    click_on 'Unlike this post'
    expect(page).to have_content('0 Likes')
  end
end

# rubocop:enable Metrics/BlockLength
