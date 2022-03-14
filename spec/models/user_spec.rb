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
    
    context 'add user without first name' do
      it 'throws error referring to first name' do
        @user.first_name = nil
        @user.save
        expect(@user.errors.full_messages).to include('First name can\'t be blank')
      end
    end
  end
end
