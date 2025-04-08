---
title: PC環境構築手順
description: 下川研究室
github:
  is_project_page: true
---
# はじめに

下川研では研究活動を行う際に、様々なソフトウェアを利用する。
代表的なものとして以下のようなものがある。

- Git : ソフトウェアのバージョン管理
- GitHub Desktop : Git 用 GUI
- Visual Studio Code : 汎用エディタ
- Docker Desktop : コンテナ実行環境

# インストールするもの

ここでは、以下のソフトウェアのインストール方法を説明する。
また、Windows と Mac 用のインストール方法を説明する。
自分が使っている PC の環境に合わせて作業をすること。

- パッケージ管理ソフト
  - Chocolatey (Windows の場合)
  - Homebrew (Mac の場合)
- Git
- GitHub Desktop
  - これに先立って GitHub のアカウント作成についても説明する
- Visual Studio Code
- Docker Desktop

# パッケージ管理ソフト

各種ソフトウェアを管理するのに、パッケージ管理ソフトと呼ばれるソフトウェアを利用する。
これにより様々なソフトウェアの管理を一元化する。
パッケージ管理ソフトは、パッケージマネージャと呼ばれることもある。

Windows では  *Chcolatey* , Mac では *Homebrew* というパッケージ管理ソフトを利用する。

パッケージ管理ソフトを使ってコマンドラインでインストール作業を行う。
最初のうちは、コマンド入力が大変に感じるかもしれない。
しかし、慣れてくると分かるが GUI で操作するよりも、
コマンドラインで操作するほうが再現性が高く、間違いが少ない。

## Windows : Chocolatey

1. `PowerShell` を管理者権限で実行する
 1. Windows メニューから Windows Power Shell のメニューを開く
 1. Windows Power Shell という項目の上で右クリックし、**管理者として実行する**をクリック
   <img src="powershell-menu.png" width="50%">
 1. Chcolatey本家の[インストール情報ページ](https://chocolatey.org/install#installing-chocolatey)の、以下の右端の青い○で囲まれた部分をクリックし、インストール用コマンドラインをコピーする
    ![Chocolatey](chocolatey-install.png)
 1. PowerShell ウィンドウ上に貼り付ける
 - ウィンドウ上で **`Ctrl-v  Enter`** を入力
 - これで Chcolatey のインストールが完了

## Mac : Homebrew

1. `ターミナル` を実行する
 1. **ドック** から `Launchpad` を実行
 1. **その他** の中の `ターミナル` を実行
1. [HomeBrew本家](https://brew.sh/ja/) の以下の右端の赤い◯で囲まれた部分をクリックし、インストール用コマンドラインをコピーする
    ![homebrew](homebrew-install.png)
1. ターミナル上に貼り付ける
 - ウィンドウ上で **`Command-v Enter`** を入力
 - この後 **Password:** と表示されたら、mac のログインパスワードを入力
 - Press **Return/Enter** to continue or any other key to abord: と表示されたら `Enter` キーを叩く
1. Homebrew のインストールが終了するので、以下を実行し、Homebrew を有効化する
```
echo >> ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## Git

### Windows

- 管理者権限で起動した PowerShell 上で **`choco install -y git`** を実行し、git をインストールする

### Mac

- Mac は標準でも Git がインストールされているが、バージョンが古い。 そこで Homebrew を使い最新版の Git をインストールする。
- ターミナル上で **`brew install git`** を実行する

## GitHub

Git では中央リポジトを利用する。
下川研では中央リポジトリとして GitHub.com のサービスを利用する。
そこで [このドキュメント](github-account.pdf)に従って GitHub のアカウントを登録する

下川研では、GitHub に [smkwlab organization](https://github.com/smkwlab/)を作成し、
共同作業に利用している。
この登録作業は下川にしか出来ないので、登録した GitHub アカウントを、下川まで連絡する。

## GitHub Desktop

Git や GitHub を操作するための GUI として GitHub Desktop を使う。
本来はコマンドラインの使い方を覚えてほしいが、まずは使えるようになることが先決。

### Windows の場合

- 管理者権限の PowerShell 上で **`choco install -y github-desktop`** を実行

### Mac の場合

- ターミナル上で **`brew install --cask github`** を実行

## Visual Studio Code

Visual Studio Code(以下 VScode) は汎用エディタである。
下川研では Markdown ファイルの編集演習を行う。
この際に VScode の preview モードが便利なので、これを利用する。
なお、TeraPad や Eclipse の代わりにも使えるので、興味がある人は使ってみるとよい。
さらに GitHub Desktop を使う必要をなくすこともできる。

### Windowsの場合

- 管理者権限の PowerShell 上で **`choco install -y vscode`** を実行

### Mac の場合
       
- ターミナル上で **`brew install --cask visual-studio-code`** を実行

### 日本語化
VScode インストール後、[この記事](https://www.atmarkit.co.jp/ait/articles/1805/18/news032.html)を参考に表示言語を日本語にしておくと便利かもしれない。
英語表示のまま使っても何も問題はない

## Docker Desktop

Docker Desktop はコンテナ実行環境である。

### Windows の場合

- 管理者権限の PowerShell 上で **`choco install -y docker-desktop`** を実行

### Mac の場合

- ターミナル上で **`brew install --cask docker`** を実行
