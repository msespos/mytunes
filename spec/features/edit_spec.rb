# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Editing profile', type: :feature do
  before(:all) do
    @mike = create(:user)
  end

  scenario 'successful signup and profile edit displays user profile page' do
    visit root_path
    click_on 'Sign up'
    fill_in 'Name', with: 'Alicia'
    fill_in 'Email', with: 'alice@example.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    fill_in 'Name', with: 'Alice'
    click_on 'Update'
    expect(page).to have_content("Alice's Profile")
  end

  scenario 'successful login and navigation to profile edit displays profile edit page' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'm:ke'
    click_on 'Edit Your Profile'
    expect(page).to have_content("Edit Your Profile\nFill in the form and click Update")
  end

  scenario "unsuccessful profile edit with blank name displays profile edit page" do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'm:ke'
    click_on 'Edit Your Profile'
    fill_in 'Name', with: ''
    click_on 'Update'
    expect(page).to have_content("Edit Your Profile\nFill in the form and click Update")
  end

  scenario "unsuccessful profile edit with blank name displays name can't be blank flash" do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'm:ke'
    click_on 'Edit Your Profile'
    fill_in 'Name', with: ''
    click_on 'Update'
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'successful profile edit of project name displays new project name' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'm:ke'
    click_on 'Edit Your Profile'
    fill_in 'Project name', with: 'blanket forts'
    click_on 'Update'
    expect(page).to have_content('Project: blanket forts')
  end

  scenario 'successful profile edit of location displays new location' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'm:ke'
    click_on 'Edit Your Profile'
    fill_in 'Location', with: 'Lomita'
    click_on 'Update'
    expect(page).to have_content('Location: Lomita')
  end

  scenario 'successful profile edit of favorite artist displays new favorite artist' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'm:ke'
    click_on 'Edit Your Profile'
    fill_in 'Favorite artist', with: 'Nirvana'
    click_on 'Update'
    expect(page).to have_content('Favorite artist: Nirvana')
  end

  scenario 'successful profile edit of birthday displays new birthday' do
    visit root_path
    fill_in 'Email', with: 'mike@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'm:ke'
    click_on 'Edit Your Profile'
    fill_in 'Birthday', with: '07/08/1975'
    click_on 'Update'
    expect(page).to have_content('August 7, 1975')
  end
end

# rubocop:enable Metrics/BlockLength
