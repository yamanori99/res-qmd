# my-research-project

Quartoを使用した研究プロジェクト

この`README.md`は, プロジェクトの管理についてのメモである。内容については**保証しない**。

## 概要

このプロジェクトは、Quartoを使用して管理し、文書化するためのリポジトリです。実施したシミュレーションの実行、結果の分析、レポートの生成を一貫した方法で行うことができます。(らしい)


## 環境設定

1.  Pythonの仮想環境を作成し、アクティベートします：

    ``` zsh
    python3 -m venv venv
    source venv/bin/activate
    ```

2.  pipをアップデートします：

    ``` zsh
    pip install --upgrade pip
    ```

3.  必要なパッケージをインストールします：

    ``` zsh
    pip install -r requirements.txt
    ```

4.  Jupyterカーネルを作成します：

    ``` zsh
    python -m ipykernel install --user --name=venv_kernel --display-name="Python (venv)"
    ```

5.  `_quarto.yml`ファイルに以下の設定を追加します：

    ``` yaml
    python:
      venv: "venv"
    ```

## requirements.txt について

`requirements.txt`ファイルは、このプロジェクトで必要なPythonパッケージとそのバージョンを記載したものです。このファイルは以下の目的で使用されます：

1.  プロジェクトの依存関係を明示的に記述し、環境の再現性を確保する
2.  `pip install -r requirements.txt`コマンドで必要なパッケージを一括インストールする
3.  仮想環境ツール（venv, virtualenv, conda）で環境を構築する際の基礎として使用する
4.  CI/CDツール（GitHub Actions, GitLab CI）での環境設定に利用する
5.  コンテナ化（Docker）やクラウドデプロイメント（Heroku, GCP, AWS）での環境構築に使用する
6.  IDE（PyCharm, VS Code）でのプロジェクト設定に活用する

このファイルを適切に管理することで、異なる環境間での一貫性を保ち、プロジェクトの移植性と再現性を高めることができます。

## 使用方法

1.  プロジェクトをクローンまたはダウンロードします。

2.  上記の環境設定手順に従って、仮想環境を設定します。

3.  `_quarto.yml` ファイルでプロジェクト全体の設定を行います。

4.  `docs/index.qmd` ファイルを編集し、プロジェクトの詳細を記入します。

5.  シミュレーションコードを `src/simulations/` ディレクトリに配置します。

6.  分析スクリプトを `src/analysis/` ディレクトリに配置します。

7.  Quartoを使用してプロジェクトをレンダリングします：

    ``` zsh
    quarto render docs/index.qmd
    ```

## 主要なファイル

### \_quarto.yml

このファイルでプロジェクトの全体設定を行います。出力形式、ナビゲーション構造、参考文献などを設定できます。

### docs/index.qmd

このファイルがプロジェクトのメインドキュメントです。プロジェクト概要、シミュレーション実行、結果分析、主要な発見を記述します。

### src/utils/compile_java.py

このファイルにはJavaファイルをコンパイルするためのユーティリティ関数が含まれています。

## カスタマイズ

-   `_quarto.yml` の `execute: freeze: true` を `false` に変更することで、毎回コードを再実行できます。
-   `index.qmd` の各チャンクで `#| cache: true` オプションを使用して、個別にキャッシュを制御できます。

## quarto render

### \_extensions

拡張フォーマットのレンダリングは以下のように行う。

```{zsh}
quarto render docs/HBESJ2024/poster.qmd --to ja-poster-typst
```

## 注意事項

-   大規模なシミュレーションの場合、実行時間が長くなる可能性があります。
-   バージョン管理には Git を使用することを推奨します。
-   Javaコンパイルには適切なJDKがインストールされている必要があります。

## 個人的なメモ

### requirements.txt の生成と調整

このプロジェクトでは、主に`pipreqs`を使用して初期の`requirements.txt`ファイルを生成しています：

``` bash
pipreqs .
```

ただし、`pipreqs`は静的解析を行うため、Jupyter関連のパッケージなど、直接コード内で使用されていないが必要なパッケージを検出できないことがあります。(たしかに, 今回はダメかも)

代替方法として、`pip freeze`コマンドを使用して現在の環境にインストールされているすべてのパッケージを出力することもできます：

``` bash
pip freeze > requirements.txt
```

ただし、この方法は環境内のすべてのパッケージを含むため、プロジェクトに直接関係のないパッケージも含まれる可能性があります。そのため、仮想環境内で実行することをお勧めします。

いずれの方法を使用しても、以下のパッケージを手動で`requirements.txt`に追加する必要があるかもしれません：

-   jupyter
-   jupyter-cache
-   ipykernel

これらのパッケージは、Jupyter環境の使用に必要です。

`requirements.txt`を更新した後は、以下のコマンドで仮想環境に必要なパッケージをインストールしてください：

``` bash
pip install -r requirements.txt
```

注意: Quartoはシステムレベルでインストールする必要があり、Pythonの仮想環境には含まれません。Quartoのインストールについては、[Quartoの公式ドキュメント](https://quarto.org/docs/get-started/)を参照してください。

定期的に`pipreqs`または`pip freeze`を実行し、新しい依存関係を追加した場合は、手動で追加したパッケージが削除されていないか確認してください。また、`pip freeze`を使用した場合は、不要なパッケージが含まれていないか確認し、必要に応じて削除してください。

この修正により、以下の点が明確になります：

1.  Quartoは Python の仮想環境の一部ではなく、別途システムレベルでインストールする必要があること。
2.  `requirements.txt` には Python の依存関係のみが含まれること。
3.  Jupyter 関連のパッケージは手動で追加する必要があること。

これらの変更により、プロジェクトの設定に関する誤解を避け、正確な環境構築手順を提供することができます。

### GitHubリポジトリの状態に戻す方法

プロジェクトをGitHubにアップロードした最新の状態に戻すには、以下の手順を実行してください：

1.  現在の変更を全て破棄し、最後のコミットの状態に戻す：

    ```         
    git reset --hard HEAD
    ```

2.  トラッキングされていないファイルを削除：

    ```         
    git clean -fd
    ```

3.  リモートの最新の状態を取得：

    ```         
    git fetch origin
    ```

4.  ローカルのmainブランチをリモートのorigin/mainブランチと同じ状態にする：

    ```         
    git reset --hard origin/main
    ```

これらのコマンドを順番に実行することで、ローカルのリポジトリをGitHubにアップロードした最新の状態に戻すことができます。

注意: これらのコマンドは、コミットしていないローカルの変更を全て破棄します。重要な変更がある場合は、先にコミットまたはスタッシュしてから実行してください。

### 相対パス

相対パスは、現在のディレクトリを基準にしてファイルやディレクトリへのパスを指定する方法です。以下に、相対パスの基本的な書き方を説明します。

#### 基本的な相対パスの書き方

1.  **同じディレクトリ内のファイル**:

    -   ファイル名だけを指定します。

    ``` plaintext
    example.txt
    ```

2.  **親ディレクトリのファイル**:

    -   `..`を使って親ディレクトリに移動します。

    ``` plaintext
    ../example.txt
    ```

3.  **子ディレクトリのファイル**:

    -   ディレクトリ名を指定して、その中のファイルを指定します。

    ``` plaintext
    subdir/example.txt
    ```

4.  **親ディレクトリのさらに上のディレクトリのファイル**:

    -   `..`を繰り返して上の階層に移動します。

    ``` plaintext
    ../../example.txt
    ```

5.  **同じ階層の別のディレクトリのファイル**:

    -   `..`で親ディレクトリに移動し、そこから目的のディレクトリに移動します。

    ``` plaintext
    ../otherdir/example.txt
    ```

#### 例

-   現在のディレクトリが`/home/user/project`で、`project`内に`data`というディレクトリがあり、その中に`file.txt`がある場合:
    -   `data/file.txt`と指定します。
-   `project`の親ディレクトリにある`config.yaml`を指定する場合:
    -   `../config.yaml`と指定します。

相対パスは、プロジェクトのディレクトリ構造が変わった場合でも、ファイルの相対的な位置が変わらない限り、パスを修正する必要がないため便利です。

# Quartoメモ

実行・チャンクオプションについて:

https://quarto.org/docs/projects/code-execution.html

Rmarkdownについての資料も参考になる。

https://kazutan.github.io/kazutanR/Rmd_intro.html#rチャンク(chunk)の基本

# Javaメモ

そもそもqmdファイル内でのチャンクを実行するのと, レンダリング・プレビューで実行されるディレクトリは違うので注意が必要。また, IDEか, GPTが勝手にjavaファイルをパッケージ化していて不具合が出た (javaファイルにパッケージの記述が追加されていた)。

## Java ファイルのコンパイルメモ

以下は、これまでのJavaファイルのコンパイルに関する議論を要約したメモです。

基本的なコンパイル

1.  カレントディレクトリにあるJavaファイルをコンパイル

```         

javac Paper_code_link.java
```

• これは、カレントディレクトリにある .java ファイルをコンパイルして、同じ場所に .class ファイルを生成する標準的な方法。

カレントディレクトリ以外のファイルをコンパイル

2.  パスを指定してファイルをコンパイル • カレントディレクトリ以外の場所にある .java ファイルをコンパイルする場合は、ファイルのパスをフルパスまたは相対パスで指定。

```         
javac src/replication-java/Paper_code_link.java
```

• これにより、src/replication-java/ に .class ファイルが生成される。

パッケージを含むファイルのコンパイル

3.  パッケージがある場合のコンパイル • パッケージが指定された Java ファイルをコンパイルするには、出力ディレクトリを -d オプションで指定し、クラスファイルがパッケージ構造に従って正しい場所に生成されるようにする。

```         
javac -d bin src/replication-java/Paper_code_link.java
```

• このコマンドは、パッケージ replication-java 内の Paper_code_link.java をコンパイルし、bin/replication-java/ ディレクトリに .class ファイルを配置。

複数ファイルのコンパイル

4.  複数のJavaファイルを一括でコンパイル • 複数の .java ファイルを同時にコンパイルするには、各ファイルを指定するか、ディレクトリ全体を指定して一括コンパイルが可能。

```         
javac -d bin src/replication-java/\*.java
```

• \*.java は、指定したディレクトリ内のすべての .java ファイルをコンパイルする。

## クラスファイルの実行

5.  カレントディレクトリにないクラスファイルの実行 • java コマンドでカレントディレクトリ以外のクラスファイルを実行する際には、-cp オプションを使用してクラスパスを指定。

```         
java -cp bin replication-java.Paper_code_link
```

• クラスパスに bin ディレクトリを指定し、完全修飾クラス名（パッケージ名を含む）でクラスを実行。

6.  複数のクラスパス指定 • 複数のディレクトリや JAR ファイルにクラスがある場合、-cp オプションでそれらを区切って指定できる。Linux/macOS ではコロン :, Windows ではセミコロン ; を使用。

```         
java -cp bin:lib replication-java.Paper_code_link \# Linux/macOS java -cp bin;lib replication-java.Paper_code_link \# Windows
```

エラーメッセージ

7.  ClassNotFoundException • クラスが見つからない場合、このエラーが発生。主な原因は以下： • クラスパスの設定が正しくない。 • クラス名が誤っている（パッケージ名を含めて正しく指定する必要がある）。 • .class ファイルが正しい場所にない。
8.  Status 1 エラー • コマンドがエラーで終了した際に表示される。エラーメッセージの詳細を確認し、主にクラスパスやパッケージ名の誤りが原因であることが多い。

このメモを基に、今後のJavaのコンパイルと実行時の作業を効率的に進めることができます。

## binディレクトリ

bin ディレクトリとは、コンパイルされたバイナリ（.class ファイルなど）や実行可能ファイルを格納するために使用されるディレクトリのことです。bin は「binary」の略で、多くのプロジェクトや開発環境で標準的に使われるディレクトリ名です。

Javaの場合、ソースコードである .java ファイルをコンパイルすると、Javaコンパイラ javac が .class ファイルを生成します。この .class ファイルをまとめて配置するために、bin ディレクトリを指定して使用します。たとえば、以下のコマンドで .class ファイルを bin ディレクトリに配置できます。

```
javac -d bin src/replication-java/Paper_code_link.java
```

このコマンドでは、src/replication-java/ にある .java ファイルをコンパイルし、結果の .class ファイルを bin ディレクトリに出力します。これにより、ソースコードとバイナリファイルを整理して管理できるので、プロジェクトが大規模になるほど便利です。

一般的なディレクトリ構成例

```
project-root/
├── src/                # ソースコード (.java)
│   └── replication-java/
│       └── Paper_code_link.java
├── bin/                # コンパイル済みのバイナリ (.class)
│   └── replication-java/
│       └── Paper_code_link.class
└── lib/                # 外部ライブラリ (JARファイルなど)
```

## ライセンス

[MIT License](LICENSE)
