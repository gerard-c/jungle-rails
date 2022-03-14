require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new
      @user.first_name = 'test'
      @user.last_name = 'test'
      @user.email = 'test@test'
      @user.password = 'test'
      @user.password_confirmation = 'test'
    end
  end
end
