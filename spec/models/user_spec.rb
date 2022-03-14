require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new
    @user.first_name = 'test'
    @user.last_name = 'test'
    @user.email = 'test@test'
    @user.password = 'test'
    @user.password_confirmation = 'test'
  end

  describe 'Validations' do  
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
        @user2.email = 'test@TEST' # testing for downcasing on email validation
        @user2.password = 'test'
        @user2.password_confirmation = 'test'

        @user.save
        @user2.save
        expect(@user2.errors.full_messages).to include('Email has already been taken')
      end
    end

    context 'add user without password' do
      it 'throws error referring to password' do
        @user.password = nil
        @user.save
        expect(@user.errors.full_messages).to include('Password can\'t be blank')
      end
    end

    context 'add user without password confirmation' do
      it 'throws error referring to password confirmation' do
        @user.password_confirmation = nil
        @user.save
        expect(@user.errors.full_messages).to include('Password confirmation can\'t be blank')
      end
    end

    context 'add user without matching password, password confirmation' do
      it 'throws error referring to password' do
        @user.password_confirmation = 'tset'
        @user.save
        expect(@user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
      end
    end

    context 'add user with short password' do
      it 'throws error referring to password minimum length' do
        @user.password = 'tes'
        @user.save
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 4 characters)')
      end
    end
  end

  describe '.authenticate_with_credentials' do
    context 'user authentication is successful' do
      it 'returns user object' do
        @user.save
        user = User.authenticate_with_credentials(@user.email, @user.password)
        expect(user).to be_instance_of(User)
      end
    end
  end
end
