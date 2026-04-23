require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー名' do
    it '1文字以上の場合、Userは有効であること' do
      user = User.new(name: 'aaa', email: 'email', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end
    it '未入力の場合、Userは無効であること' do
      user = User.new(name: '', email: 'email', password: 'password', password_confirmation: 'password')
      expect(user).to be_invalid
    end
    it '11文字以上の場合、Userは無効であること' do
      user = User.new(name: 'a'*11, email: 'email', password: 'password', password_confirmation: 'password')
      expect(user).to be_invalid
    end
  end

  describe 'email' do
    it '未入力の場合、Userは無効であること' do
      user = User.new(name: 'aaa', email: '', password: 'password', password_confirmation: 'password')
      expect(user).to be_invalid
    end
    it '1文字以上の場合、Userは有効であること' do
      user = User.new(name: 'aaa', email: 'email', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end
  end

  describe 'password' do
    it '未入力の場合、Userは無効であること' do
      user = User.new(name: 'aaa', email: 'email', password: '', password_confirmation: '')
      expect(user).to be_invalid
    end
    it '7文字以下の場合、Userは無効であること' do
      user = User.new(name: 'aaa', email: 'email', password: 'a' * 7, password_confirmation: 'a' * 7)
      expect(user).to be_invalid
    end
    it '8文字以上の場合、Userは有効であること' do
      user = User.new(name: 'aaa', email: 'email', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end
  end
end
