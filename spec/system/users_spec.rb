require 'rails_helper'

describe "ユーザー表示機能", type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'emailA') }

  describe "ユーザー詳細表示機能" do
    before do
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
      expect(page).to have_current_path('/')
    end

    context 'ログイン時' do
      let(:login_user) { user_a }
      it "ユーザー詳細が表示されるか" do
        visit user_path(user_a)
        expect(page).to have_current_path(user_path(user_a))
        expect(page).to have_content("ユーザーA")
      end
    end
  end
end
