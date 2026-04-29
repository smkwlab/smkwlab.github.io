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

1. [pcenv-setup-all.bat](pcenv-setup-all.bat) をダウンロード
2. ダウンロードした **pcenv-setup-all.bat** をダブルクリックして実行
3. **このアプリがデバイスに変更を加えることを許可しますか？** というダイアログに対しては `はい` をクリック
4. WSL が新たに有効化された場合は、画面の指示に従って PC を再起動し、再度 **pcenv-setup-all.bat** をダブルクリックして実行

## 1.2 Mac の場合

1. [pcenv-setup-all.sh](pcenv-setup-all.sh) をダウンロード
2. `ターミナル` を開き、ダウンロードしたディレクトリに移動
3. 以下のコマンドを実行
    ```
    bash pcenv-setup-all.sh
    ```
