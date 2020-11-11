# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.feature 'SendInvitations', type: :feature do
  scenario 'can send an invitation' do
    visit '/users/sign_up'
    fill_in :user_name, with: 'Khalil hamdi'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_on 'Sign up'
    visit '/users/'
    visit '/users/sign_out'
    visit '/users/sign_up'
    fill_in :user_name, with: 'Daniel Ronan'
    fill_in :user_email, with: 'Danii@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_on 'Sign up'
    visit '/users/'
    click_on 'Send invitation'
    expect(page).to have_content 'Pending Invitation'
  end

  scenario 'user name invited should apprear in the pending friends list' do
    visit '/users/sign_up'
    fill_in :user_name, with: 'Khalil hamdi'
    fill_in :user_email, with: 'khaalil.hamdi@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_on 'Sign up'
    visit '/users/'
    visit '/users/sign_out'
    visit '/users/sign_up'
    fill_in :user_name, with: 'Daniel Ronan'
    fill_in :user_email, with: 'Danii@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_on 'Sign up'
    visit '/users/'
    click_on 'Send invitation'
    visit '/friendships/'
    within('div#pending_friends') do
      expect(page).to have_content 'Khalil hamdi'
    end
  end
end
# rubocop:enable Metrics/BlockLength
