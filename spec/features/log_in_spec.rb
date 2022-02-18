# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  before(:all) do
    @mike = create(:user)
    @katie = create(:user, name: 'Katie', email: 'katie@example.com')
  end

  scenario 'failed login with no email or password displays signup page' do
    visit root_path
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_on 'Log in'
    expect(page).to have_content('Log in')
  end

  scenario 'successful login displays user home page' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    expect(page).to have_content('Your Feed')
  end
end

# rubocop:enable Metrics/BlockLength
