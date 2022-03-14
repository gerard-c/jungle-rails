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

    context 'add user without last name' do
      it 'throws error referring to last name' do
        @user.last_name = nil
        @user.save
        expect(@user.errors.full_messages).to include('Last name can\'t be blank')
      end
    end

    context 'add user without email' do
      it 'throws error referring to email' do
        @user.email = nil
        @user.save
        expect(@user.errors.full_messages).to include('Email can\'t be blank')
      end
    end

    context 'add user without unique email' do
      it 'throws error referring to unique email' do
        @user2 = User.new
        @user2.first_name = 'test'
        @user2.last_name = 'test'
        @user2.email = 'test@test'
        @user2.password = 'test'
        @user2.password_confirmation = 'test'

        @user.save
        @user2.save
        expect(@user2.errors.full_messages).to include('Email has already been taken')
      end
    end
  end
end
