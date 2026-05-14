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

1. [pcenv-setup-stage1.bat](pcenv-setup-stage1.bat) と [pcenv-setup-stage2.bat](pcenv-setup-stage2.bat) をダウンロード
2. **pcenv-setup-stage1.bat** をダブルクリックして実行（UAC ダイアログで `はい` をクリック）
3. 途中で Docker Desktop のインストーラが起動したら、**Use WSL 2 instead of Hyper-V (recommended)** にチェックが入っていることを確認する。チェックが外れていたら入れてから次に進む。
4. インストール完了のメッセージが表示されたら、PC を再起動
5. 再起動後、**pcenv-setup-stage2.bat** をダブルクリックして実行
6. VS Code 拡張機能のインストール完了メッセージが表示されたら、何かキーを押す
7. Ubuntu のインストール後、Ubuntu のウィンドウが開き、Linux 用のユーザー名・パスワードを設定する画面になる。画面の指示に従って設定する。設定が終わったら `exit` と入力するか、Ubuntu のウィンドウを閉じる

## 1.2 Mac の場合

1. [pcenv-setup-all.sh](pcenv-setup-all.sh) をダウンロード
2. `ターミナル` を開き、ダウンロードしたディレクトリに移動
3. 以下のコマンドを実行
    ```
    bash pcenv-setup-all.sh
    ```
