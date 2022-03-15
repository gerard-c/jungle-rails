require 'rails_helper'

RSpec.feature "User logs in", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'test',
      last_name: 'test',
      email: 'test@test', 
      password: 'test',
      password_confirmation: 'test'
    )
  end

  scenario 'Create Account and Login in the top nav are replaced by Logout' do
    # ACT
    visit '/login'
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_on 'Submit'

    # VERIFY
    expect(page).to have_content('Logout')

  end
end
