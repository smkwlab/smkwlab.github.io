---
title: 一括インストール
description: 下川研究室用開発環境一括セットアップ
github:
  is_project_page: true
---
# 1. 説明を読み飛ばして、とりあえず全部インストールしたい場合

全てまとめてインストールするプログラムを用意した。
ただ、インストール後でも良いので、[元のドキュメント](.) 全体には目を通しておこう。

## 1.1 Windows の場合

1. WSL をインストールする
    1. [pcenv-setup-wsl.bat](pcenv-setup-wsl.bat) をダウンロード
    2. ダウンロードした **pcenv-setup-wsl.bat** を右クリックし、`管理者として実行` を選択
    3. **このアプリがデバイスに変更を加えることを許可しますか？** というダイアログに対しては `はい` をクリック
    4. インストール完了後、PC を再起動
2. 残りのソフトをインストール
    1. [pcenv-setup-all.bat](pcenv-setup-all.bat) をダウンロード
    2. ダウンロードした **pcenv-setup-all.bat** を右クリックし、`管理者として実行` を選択

## 1.2 Mac の場合

1. [pcenv-setup-all.sh](pcenv-setup-all.sh) をダウンロード
2. `ターミナル` を開き、ダウンロードしたディレクトリに移動
3. 以下のコマンドを実行
    ```
    bash pcenv-setup-all.sh
    ```
