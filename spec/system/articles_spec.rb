require 'rails_helper'

describe '記事表示機能', type: :system do
  describe '一覧表示機能' do
    before do
      # 記事Aの作成
      FactoryBot.create(:article)
    end
    context '表示できるか' do
      before do
        # ログインしない
        visit articles_path
      end
      it '記事が表示される' do
        # 記事が画面上に表示されていることを確認
        expect(page).to have_content 'taitoru'
      end
    end
  end
end
