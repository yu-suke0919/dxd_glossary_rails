require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー名' do
    it '1文字以上の場合、Userは有効であること' do
      user = User.new(name: 'aaa', email: 'email', password: 'pass', password_confirmation: 'pass')
      expect(user).to be_valid
    end
  end
  
  describe 'ユーザー名' do
    it '未入力の場合、Userは無効であること' do
      user = User.new(name: '', email: 'email', password: 'pass', password_confirmation: 'pass')
      expect(user).to_not be_valid
    end
  end
  
end
