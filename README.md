# dxd-glossary_rails

ゲームの攻略記事投稿サイトです。
ユーザー登録機能や記事のCRUD機能に加えて、各記事にコメントを投稿できます。

DragxDrive(=dxd)というゲームに向けて作成しましたが、リポジトリにはゲームのコンテキストは含まれていないため、他のゲーム用のサイトとしても流用可能です。

## URL
準備中
ログインしなくても記事を確認することができます。

## 作成背景
・Ruby学習のため

・そのゲームのコミュニティにおいて、攻略情報やノウハウが蓄積されているものの、情報の公開場所がユーザーごとに色々なSNSに散らばっており情報にアクセスしづらいという課題があった。

情報を探している人が見つけやすくするためのポータルサイト及び記事を投稿するサイトが必要であると感じていた。

# 機能一覧
- ユーザー登録、ログイン機能(deviceなし)
- 記事投稿機能
  - 記事CRUD
  - 記事に対するコメント機能
- 記事検索機能(ransack)

![docs内の画面遷移図](docs/plantuml/アプリ_画面遷移図.png)

![docs内のER図](docs/plantuml/アプリ_ER図.png)

# テスト
- RSpec
  - 単体テスト(model)

# 使用技術
* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
