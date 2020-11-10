# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.feature 'AcceptInvitations', type: :feature do
  scenario 'user can accept invitation' do
    visit '/users/sign_up'
    fill_in :user_name, with: 'Khalil hamdi'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_on 'Sign up'
    visit '/users/'
    click_on 'Sign out'
    visit '/users/sign_up'
    fill_in :user_name, with: 'Daniel Ronan'
    fill_in :user_email, with: 'Danii@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_on 'Sign up'
    visit '/users/'
    click_on 'Send invitation'
    click_on 'Sign out'
    visit '/users/sign_in'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    fill_in :user_password, with: 'password'
    click_on 'Log in'
    visit '/friendships/'
    within('div#friend_requests') do
      expect(page).to have_content 'Accept Invitation'
    end
  end

  scenario 'Friend should appear in the friend list after accepting invitation' do
    visit '/users/sign_up'
    fill_in :user_name, with: 'Khalil hamdi'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_on 'Sign up'
    visit '/users/'
    click_on 'Sign out'
    visit '/users/sign_up'
    fill_in :user_name, with: 'Daniel Ronan'
    fill_in :user_email, with: 'Danii@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_on 'Sign up'
    visit '/users/'
    click_on 'Send invitation'
    click_on 'Sign out'
    visit '/users/sign_in'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    fill_in :user_password, with: 'password'
    click_on 'Log in'
    visit '/friendships/'
    click_on 'Accept Invitation'
    visit '/friendships/'
    within('div#friend_list') do
      expect(page).to have_content 'Daniel Ronan'
    end
  end
end

# rubocop:enable Metrics/BlockLength
