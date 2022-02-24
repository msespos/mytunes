# frozen_string_literal: true

require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe 'Signing up', type: :feature do
  before(:all) do
    @mike = create(:user)
  end

  scenario 'failed signup with no fields filled in displays sign up page' do
    visit root_path
    click_on 'Sign up'
    click_on 'Sign up'
    expect(page).to have_content('Sign Up')
  end

  scenario 'successful signup displays user page' do
    visit root_path
    click_on 'Sign up'
    fill_in 'Name', with: 'Katie'
    fill_in 'Email', with: 'katie@example.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    expect(page).to have_content('Katie')
  end
end
