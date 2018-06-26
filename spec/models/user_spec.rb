require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user                       = User.new
      @user.name                  = 'Jehoseph Souvlaki'
      @user.email                 = 'js@example.com'
      @user.password              = 'veggie_bacon'
      @user.password_confirmation = 'veggie_bacon'
      @user.valid?
    end

    it 'should create a user' do
      expect(@user).to be_valid
    end

    it 'should have a name' do
      @user.name = nil
      @user.save
      expect(@user.errors.full_messages[0]).to include(@user.errors[:name][0])
    end

    it 'should have an email' do
      @user.email = nil
      @user.save
      expect(@user.errors.full_messages[0]).to include(@user.errors[:email][0])
    end

    it 'should have a case sensitive email' do
      @user.email = 'JS@example.COM'
      @user.save
      expect(@user.errors.full_messages[0])
    end

    it 'should have a password' do
      @user.password = nil
      @user.save
      expect(@user.errors.full_messages[0]).to include(@user.errors[:password][0])
    end

    it 'should have a password confirmation' do
      @user.password_confirmation = nil
      @user.save
      expect(@user.errors.full_messages[0]).to include(@user.errors[:password_confirmation][0])
    end

    it 'should have matching passwords' do
      @user.password = 'pass'
      @user.password_confirmation = 'word'
      @user.save
      expect(@user.errors.full_messages[0]).to include(@user.errors[:password_confirmation][0])
    end



  end

end
