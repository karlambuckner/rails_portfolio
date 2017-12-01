require 'rails_helper'

describe 'test for admin protection' do
  it 'will allow admin to see the admin page' do
    FactoryBot.create(:admin)
    visit new_user_session_url
    fill_in 'Email', :with => 'admin@admin.com'
    fill_in 'Password', :with => 'adminpassword'
    click_button 'Log in'
    visit rails_admin_url
    expect(page).not_to have_content "About Me"
  end

  it 'will protect admin page from non-admins' do
    FactoryBot.create(:user)
    visit new_user_session_url
    fill_in 'Email', :with => 'user@user.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    visit rails_admin_url
    expect(page).to have_content "About Me"
  end
end
