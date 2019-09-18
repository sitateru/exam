## 概要

コーディングテスト用のサンプルAPIサーバ
KPTのデータを管理する

## セットアップ

gitやruby、bundlerのセットアップは割愛

1. リポジトリをローカルにクローン
1. ```bundle install```
1. ```rails db:create```
1. ```rails db:migrate```
1. ```rails db:seed```

## 起動

```rails s```

## テスト

```rspec```

## 機能(first commit時点)

issueリソースを持ち、issueの一覧取得と作成が可能

- GET /issues Issueの一覧
- POST /issues Issueの新規作成

## 実装方針

- 原則RESTに則りリソースのCRUDを定義する
- コード追加時は最低限当該コードをカバーするrspecを追加する
- gemの追加は制限しないが、安定性・メンテ性等は考慮のこと

## コーディングテスト固有の前提

- フロントエンドが無いとほぼ意味のないアプリケーションですが、フロントエンドはありません。フロントエンドがある想定で取り組んでください
- production環境の考慮は不要です（rspecが通ること、RAILS_ENV=developmentで動作することまで見られればOKです）

## 進め方

- リポジトリのIssueを確認し、Issueに記載された要件を実装してmasterブランチ宛にPRを出してください
- 必要に応じ、要件の確認や実装内容の補足など、IssueやPRに記載してください
