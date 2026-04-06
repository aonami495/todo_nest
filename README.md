# TodoNest

個人向けタスク管理アプリケーション。
タスクの作成・編集・削除に加えて、ステータスによる絞り込みや並び替えができます。

Rails の基本的な CRUD 機能に加えて、i18n による日本語対応や System Test による画面操作テストも実装しています。

---

## 主な機能

- タスクの作成・編集・削除（CRUD）
- ステータス別タブフィルタリング（未着手 / 進行中 / 完了）
- 並び替え（期限日・優先度・作成日）
- 期限切れ・期限間近のタスクを視覚的に警告表示
- enum を使ったステータス・優先度管理
- i18n による日本語表示対応

---

## 技術スタック

- Ruby 3.2.2
- Ruby on Rails 7.2.3
- PostgreSQL
- Tailwind CSS v4
- Hotwire (Turbo + Stimulus)
- importmap-rails
- Minitest + Capybara + Selenium

---

## テスト

以下のテストを実装しています。

- **Model Test** — バリデーション、scope（with_status, sorted）の動作確認
- **Controller Test** — CRUD 操作、フィルタリング、ソートの確認
- **System Test** — 実際の画面操作によるタスク作成・編集・削除フローの検証

```bash
# 全テスト実行
bin/rails test

# System Test 実行
bin/rails test:system
```

---

## セットアップ

```bash
git clone https://github.com/aonami0495-droid/todo_nest.git
cd todo_nest
bundle install
bin/rails db:create db:migrate
bin/dev
```

ブラウザで http://localhost:3000 にアクセス

---

## DB 構成

### tasks テーブル

| カラム | 型 | 説明 |
|---|---|---|
| title | string | タイトル（必須・50文字以内） |
| description | text | 説明（任意） |
| due_on | date | 期限日（任意） |
| status | integer | 0: 未着手 / 1: 進行中 / 2: 完了 |
| priority | integer | 0: 低 / 1: 中 / 2: 高 |

---

## 学習目的

Rails の基本構成を理解することに加えて、以下を意識して開発しました。

- MVC の役割分担の理解
- enum・scope の活用
- i18n による表示文言の管理
- System Test による UI 動作保証
- Tailwind CSS によるモダンな UI 実装

---

## 今後の改善案

- ユーザー認証機能の追加
- タスクの検索機能
- ページネーション
