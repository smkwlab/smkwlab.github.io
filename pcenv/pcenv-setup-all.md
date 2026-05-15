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

## 1.3 仕上げ: VS Code の日本語化拡張をインストール

Windows / Mac とも、上記スクリプト実行後に VS Code の日本語化拡張を GUI からインストールする。コマンドラインからインストールすると表示言語が切り替わらないため、この手順は手動で行う。

1. VS Code を起動する（Windows Terminal / ターミナルで `code` と入力するか、アプリ一覧から起動）
2. 左サイドバーの **Extensions** アイコン（四角が 4 つ並んだアイコン）をクリック
3. 検索欄に `Japanese Language Pack` と入力
4. **Japanese Language Pack for Visual Studio Code** を選択し、**Install** をクリック
5. インストール完了後、右下に表示される **Change Display Language and Restart** をクリックし、VS Code を再起動する
