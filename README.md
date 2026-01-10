# TodoNest

個人用のタスク管理アプリです。  
タスクの作成・編集・削除に加えて、ステータスによる絞り込みや並び替えができます。

Rails の基本的な CRUD 機能に加えて、i18n による日本語対応や System Test による画面操作テストも実装しています。

---

## 🖼 画面イメージ

> `docs/` 配下にスクリーンショット画像を置く想定です。

- タスク一覧

  ![タスク一覧](docs/screenshots/tasks_index.png)

- タスク作成

  ![タスク作成](docs/screenshots/tasks_new.png)

- タスク編集

  ![タスク編集](docs/screenshots/tasks_edit.png)

---

## 🔧 主な機能

- タスクの作成・編集・削除（CRUD）
- ステータスによる絞り込み
- 並び替え（期限日・優先度・作成日）
- enum を使ったステータス・優先度管理
- i18n による日本語表示対応

---

## 🛠 技術スタック

- Ruby 3.2.2
- Ruby on Rails 7.2.2
- PostgreSQL
- Hotwire (Turbo)
- Minitest

---

## 🧪 テスト

以下のテストを実装しています。

- Model Test

  - バリデーションの検証
  - scope（with_status, sorted）の動作確認

- Controller Test

  - CRUD 操作が正しく行われることの確認

- System Test
  - 実際の画面操作によるタスク作成・編集・削除フローの検証
  - Turbo 環境下での安定動作を考慮したテスト設計

---

## 🚀 セットアップ

```bash
bundle install
bin/rails db:create db:migrate
bin/rails server
```

ブラウザで以下にアクセス：

```
http://localhost:3000/tasks
```

---

## 📝 学習目的

Rails の基本構成を理解することに加えて、以下を意識して開発しました。

- MVC の役割分担の理解
- enum・scope の活用
- i18n による表示文言の管理
- System Test による UI 動作保証

---

## 📌 今後の改善案

- ユーザー認証機能の追加
- タスクの検索機能
- ページネーション
- デザインの改善
