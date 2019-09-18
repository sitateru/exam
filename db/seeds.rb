# テスト用Issueデータの生成

Issue.create(
  title: 'プロジェクトXXの状況が見えない',
  body: '状況不明のため必要なサーバ側実装が進められない',
  kind: :problem)
Issue.create(
  title: 'デイリースクラムの実施',
  body: '毎朝10時から行う',
  kind: :keep)
Issue.create(
  title: 'Discordを使ってみる',
  body: 'MTGの能率が改善するか確認する',
  kind: :try)