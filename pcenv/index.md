---
title: PC環境構築手順
description: 下川研究室用開発環境
github:
  is_project_page: true
---
# 1. はじめに

下川研では研究活動を行う際に、様々なソフトウェアを利用する。
代表的なものとして以下のようなものがある。

- Visual Studio Code : 汎用エディタ
- Git : ソフトウェアのバージョン管理
- GitHub Desktop : Git 用 GUI
- Docker Desktop : コンテナ実行環境

## 1.1 以下の説明を読み飛ばして、とりあえず全部インストールしたい場合

[こちら](pcenv-setup-all.html) を参照。

後からで良いので、説明は読んでね。


# 2. インストールするもの

ここでは、以下のソフトウェアのインストール方法を説明する。
また、Windows と Mac 用のインストール方法を説明する。
自分が使っている PC の環境に合わせて作業をすること。

- パッケージ管理ソフト
  - WinGet (Windows の場合)
  - Homebrew (Mac の場合)
- WSL (Windows の場合のみ)
- Visual Studio Code
- Git
- GitHub Desktop
  - これに先立って GitHub のアカウント作成についても説明する
- Docker Desktop

# 3. パッケージ管理ソフトと仮想化環境

各種ソフトウェアを管理するのに、パッケージ管理ソフトと呼ばれるソフトウェアを利用する。
これにより様々なソフトウェアの管理を一元化する。
パッケージ管理ソフトは、パッケージマネージャと呼ばれることもある。

Windows では  *WinGet* , Mac では *Homebrew* というパッケージ管理ソフトを利用する。

パッケージ管理ソフトを使ってコマンドラインでインストール作業を行う。
最初のうちは、コマンド入力が大変に感じるかもしれない。
しかし、慣れてくると分かるが GUI で操作するよりも、
コマンドラインで操作するほうが再現性が高く、間違いが少ない。

また、仮想化環境として、Windows では WSL(Windows Subsystem for Linux) を利用する。
Mac では特別な追加ソフトは不要。

## 3.1 Windows : WinGet と WSL

Windows 11 では WinGet は標準でインストール済みなので作業は不要。

以降の Windows でのインストール作業は、すべて **管理者として起動した Windows Terminal** で行う。
次の手順で起動する。

1. **スタートメニュー** の **アプリ、設定、ドキュメントの検索** に `wt` と入力

    ![スタートメニューで wt を検索](start-menu1-mini2.png)
2. `管理者として実行(A)` をクリック

    ![管理者として実行を選択](start-menu2-mini2.png)
3. **このアプリがデバイスに変更を加えることを許可しますか？** というダイアログに対しては `はい` をクリック

WSL は以下の手順でインストールする。

1. 管理者として起動した Windows Terminal で以下を実行
    ```
    wsl --install --no-distribution
    ```
2. インストール後、PC を再起動する。再起動後、以降の作業のために改めて管理者として Windows Terminal を起動する。
3. Ubuntu ディストリビューションをインストールする。管理者として起動した Windows Terminal で以下を実行
    ```
    wsl --install -d Ubuntu
    ```
4. インストール完了後、Ubuntu のウィンドウが開き、初期設定が始まる。画面の指示に従って Linux 用のユーザー名とパスワードを設定する。

## 3.2 Mac : Homebrew

1. `ターミナル` を実行する
    1. **ドック** から `アプリ` を実行
    1. `ターミナル` を実行
1. [Homebrew本家](https://brew.sh/ja/) の以下の右端の赤い◯で囲まれた部分をクリックし、インストール用コマンドラインをコピーする
    ![homebrew](homebrew-install.png)
1. ターミナル上に貼り付ける
    - ウィンドウ上で **`Command-v Enter`** を入力
    - この後 **Password:** と表示されたら、Mac のログインパスワードを入力
    - Press **Return/Enter** to continue or any other key to abort: と表示されたら `Enter` キーを叩く
1. Homebrew のインストールが終了するので、以下を実行し、Homebrew を有効化する
    ```
    echo >> ~/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    ```

# 4. Visual Studio Code

Visual Studio Code(以下 VSCode) は汎用エディタである。

## 4.1 Windows の場合

- 管理者として起動した Windows Terminal で以下を実行
  ```
  winget install -e --id Microsoft.VisualStudioCode --source winget
  ```

## 4.2 Mac の場合

- ターミナル上で以下を実行
  ```
  brew install --cask visual-studio-code
  ```

## 4.3 拡張機能のインストール

以下の拡張機能をインストールする。

- リモート開発用拡張パック (Dev Containers / WSL / SSH)
- Docker 拡張
- 日本語化拡張

手順:

1. ターミナルを再起動（VS Code インストール時の PATH 更新を反映するため）
2. 以下を実行
    ```
    code --install-extension ms-vscode-remote.vscode-remote-extensionpack
    code --install-extension ms-azuretools.vscode-docker
    code --install-extension MS-CEINTL.vscode-language-pack-ja
    ```

# 5. Git

## 5.1 Windows の場合

- 管理者として起動した Windows Terminal で以下を実行
  ```
  winget install --id Git.Git -e --override "/VERYSILENT /NORESTART /NOCANCEL /SP- /o:EditorOption=VisualStudioCode /o:SSHOption=ExternalOpenSSH /o:CRLFOption=LFOnly"
  ```

## 5.2 Mac の場合

- Mac は標準でも Git がインストールされているが、バージョンが古い。 そこで Homebrew を使い最新版の Git をインストールする。
- ターミナル上で以下を実行する
  ```
  brew install git
  ```

# 6. GitHub

Git では中央リポジトを利用する。
下川研では中央リポジトリとして GitHub.com のサービスを利用する。
そこで [このドキュメント](github-account.pdf)に従って GitHub のアカウントを登録する

<!--
下川研では、GitHub に [smkwlab organization](https://github.com/smkwlab/)を作成し、
共同作業に利用している。
この登録作業は下川にしか出来ないので、登録した GitHub アカウントを、下川まで連絡する。
-->

# 7. GitHub Desktop

Git や GitHub を操作するための GUI として GitHub Desktop を使う。
本来はコマンドラインの使い方を覚えてほしいが、まずは使えるようになることが先決。

## 7.1 Windows の場合

- 管理者として起動した Windows Terminal で以下を実行
  ```
  winget install -e --id GitHub.GitHubDesktop
  ```

## 7.2 Mac の場合

- ターミナル上で以下を実行
  ```
  brew install --cask github
  ```

# 8. Docker Desktop

Docker Desktop はコンテナ実行環境である。
インストール後に再起動が必要になるかも。

## 8.1 Windows の場合

- 管理者として起動した Windows Terminal で以下を実行
  ```
  winget install -e --id Docker.DockerDesktop --source winget
  ```

## 8.2 Mac の場合

- ターミナル上で以下を実行
  ```
  brew install --cask docker
  ```
