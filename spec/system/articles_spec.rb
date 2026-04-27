require 'rails_helper'

describe '記事CRUD機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, email: 'articleemail') }
  let(:article_a) { FactoryBot.build(:article, user: user_a, title: 'taitoru') }

  describe 'C_作成機能' do
    context '非ログイン時' do
      before do
        visit articles_path
      end
      it 'ログイン画面に遷移する' do
        click_link '新規作成'
        expect(page).to have_current_path(login_path)
        expect(page).to have_css('.alert-danger', text: 'ログインしてください')
      end
    end

    context 'ログイン時' do
      before  do
        visit login_path
        fill_in 'メールアドレス', with: user_a.email
        fill_in 'パスワード', with: user_a.password
        click_button 'ログインする'
        expect(page).to have_current_path('/')
        expect(page).to have_css('.alert-success', text: 'ログインしました')
      end
      it '新規作成画面に遷移する' do
        click_link '新規作成'
        expect(page).to have_current_path(new_article_path)
      end
      it '記事を作成する' do
        click_link '新規作成'
        fill_in 'タイトル', with: 'a'
        fill_in 'カテゴリ', with: 'a'
        fill_in '記事内容', with: 'a'
        click_button '登録する'
        expect(page).to have_current_path(articles_path)
        expect(page).to have_css('.alert-success', text: '「a」を登録しました')
      end
      it '同じタイトルの記事を作成した時、失敗してエラー文が出力される' do
        article_a.save
        click_link '新規作成'
        fill_in 'タイトル', with: 'taitoru'
        fill_in 'カテゴリ', with: 'a'
        fill_in '記事内容', with: 'a'
        click_button '登録する'
        expect(page).to have_current_path(new_article_path)
        expect(page).to have_selector('#error_explanation', text: 'タイトルはすでに存在します')
      end
    end
  end
  describe 'R_表示機能' do
    before do
      article_a.save
    end
    context '非ログイン状態' do
      before do
        visit articles_path
      end
      it '記事が表示される' do
        # 記事が画面上に表示されていることを確認
        expect(page).to have_content 'taitoru'
      end

      it '記事をクリックした時、記事詳細画面に遷移する' do
        click_link 'taitoru'
        expect(page).to have_current_path(article_path(article_a))
        expect(page).to have_content '更新日時'
      end
    end
  end
  describe 'U_更新機能' do
    before do
      article_a.save
    end
    context 'ログイン状態' do
      before do
        visit login_path
        fill_in 'メールアドレス', with: user_a.email
        fill_in 'パスワード', with: user_a.password
        click_button 'ログインする'
        expect(page).to have_current_path('/')
        expect(page).to have_css('.alert-success', text: 'ログインしました')
      end
      it '記事編集画面に遷移し、更新に成功する' do
        click_link user_a.name
        within('tr', text: 'taitoru') do
          click_link '編集'
        end
        expect(page).to have_current_path(edit_article_path(article_a))
        fill_in 'タイトル', with: 'FILTERED'
        click_button '更新する'
        expect(page).to have_current_path(user_path(user_a))
        expect(page).to have_css('.alert-success', text: '「FILTERED」を登録しました')
      end
    end
  end
  describe 'D_削除機能' do
    before do
      article_a.save
    end
    context 'ログイン状態' do
      before do
        visit login_path
        fill_in 'メールアドレス', with: user_a.email
        fill_in 'パスワード', with: user_a.password
        click_button 'ログインする'
        expect(page).to have_current_path('/')
        expect(page).to have_css('.alert-success', text: 'ログインしました')
      end
      it '記事削除画面に遷移し、削除に成功する' do
        click_link user_a.name
        within('tr', text: 'taitoru') do
          accept_confirm do
            click_link '削除'
          end
        end
        expect(page).to have_current_path(user_path(user_a))
        expect(page).to have_css('.alert-success', text: 'taitoruを削除しました')
      end
    end
  end
end
