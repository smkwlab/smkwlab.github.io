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

1. [pcenv-setup-stage1.bat](pcenv-setup-stage1.bat) をダウンロード
2. **pcenv-setup-stage1.bat** をダブルクリックして実行（UAC ダイアログで `はい` をクリック）
3. インストール完了のメッセージが表示されたら、PC を再起動
4. 再起動後、[pcenv-setup-stage2.bat](pcenv-setup-stage2.bat) をダウンロード
5. **pcenv-setup-stage2.bat** をダブルクリックして実行
6. 完了メッセージが表示されたらインストール終了

## 1.2 Mac の場合

1. [pcenv-setup-all.sh](pcenv-setup-all.sh) をダウンロード
2. `ターミナル` を開き、ダウンロードしたディレクトリに移動
3. 以下のコマンドを実行
    ```
    bash pcenv-setup-all.sh
    ```
