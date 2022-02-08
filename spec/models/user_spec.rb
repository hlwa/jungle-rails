require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid' do
      @user = User.new
      @user.first_name = 'test_first'
      @user.last_name = 'last_name'
      @user.email = 'test@email.com'
      @user.password = 'test'
      @user.password_confirmation = 'test'

      expect(@user.valid?).to be true
    end

    it ' password and password_confirmation should match' do
      @user = User.new
      @user.first_name = 'test_second'
      @user.last_name = 'last_name'
      @user.email = 'test2@email.com'
      @user.password = 'true'
      @user.password_confirmation = 'false'

      @user.valid?
      expect(@user.errors[:password_confirmation]).to be_present
    end

    it 'password is required' do
      @user = User.new
      @user.first_name = 'test_first'
      @user.last_name = 'last_name'
      @user.email = 'test@email.com'
      @user.password = nil
      @user.password_confirmation = 'test'
      expect(@user).to be_invalid
      expect(@user.errors[:password]).to include("can't be blank")
    end


  end
end
