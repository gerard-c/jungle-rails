require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(email: 'test@test', password: 'test')
  end

  scenario 'The user can login' do
    # ACT
    visit '/login'

  end
end
