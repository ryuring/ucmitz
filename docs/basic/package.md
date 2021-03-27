# モノレポによるパッケージ管理

BaserApp を親パッケージとして、BaserCore、BcAdminThirdは、子パッケージとして管理します。  
複数のパッケージを統合的に管理するためにモノレポ `monorepo-builder` を利用しています。

- [BaserApp](https://github.com/baserproject/ucmitz) ：Gitでクローンした本体。親パッケージとしてbaserCMSのアプリケーションフレームを提供
- [BaserCore](https://github.com/baserproject/ucmitz/tree/dev/plugins/baser-core) ：baserCMSの本体、子パッケージとして主にURLに紐づくルーティングと、ビジネスロジックを提供　`/plugins/baser-core`
- [BcAdminThird](https://github.com/baserproject/ucmitz/tree/dev/plugins/bc-admin-third) ：子パッケージとして、baserCMSの画面表示をテーマとして提供　`/plugins/bc-admin-third`


- [BaserApp ソースコード / baserproject/basercms:dev-5-cake3](https://github.com/baserproject/ucmitz/tree/dev)
- [BaserCore ソースコード / baserproject/baser-core:dev-5-cake3](https://github.com/baserproject/baser-core/tree/dev-5-cake3)
- [BcAdminThird ソースコード / baserproject/bc-admin-third:dev-5-cake3](https://github.com/baserproject/bc-admin-third/tree/dev-5-cake3)

## package.json の役割
子パッケージの `composer.json` 記述したパッケージは、`monorepo-builder` により、親パッケージの `composer.json` にまとめあげることができ、`vendor` ディレクトリも親の `vendor` で統合的に管理することができる。

子パッケージの `composer.json` を変更した場合は、次のコマンドを実行すること。
```shell script
vendor/bin/monorepo-builder merge
```
そのため、子パッケージの `composer.lock` と `vendor` ディレクトリは利用しない。
※ .gitignore で除外済

## パッケージのリリース
モノレポを使うことで、GitHub 上のパッケージごとのレポジトリへ、一括でリリースすることができる。
ただし、子パッケージは、読み取り専用の扱いとする。

子パッケージのリリースを行う場合は、次のコマンドを実行する。
```shell script
vendor/bin/monorepo-builder split
```
### リリースに関する注意
上記のコマンドは、`master` ブランチをベースに子パッケージを分割する仕様となっているため、開発中は GitHub に反映することができない。

暫定的に GitHub に公開するために次の二つの方法で対応することができる。

1. 一時的に、開発ブランチから master ブランチを作り出して `split` を実行する
2. `monorepo-builder` のソースコードを一時的に改修して `split` を実行する

2 に関しては、`/vendor/symplify/monorepo-builder/packages/Split/src/Process/ProcessFactory.php` の53行目の `--branch=master` を `--branch=dev-5-cake3` とすることで対応できる。

baserCMS5 を開発中は、2　を利用して、開発中のコードを定期的に GitHub に公開する。

## 参考文献
[MonorepoBuilderでPHPのモノレポを作るチュートリアル](https://qiita.com/suin/items/421a55bdb009b2ada2d1)




#　プログラムの構成

## コアの構成

### コアパッケージ
baserCMSのコア（BaserCore）は、CakePHPのプラグインとしての開発を前提とし、plugins 配下内に配置する仕様とした。 `/plugins/baser-core/`

### コアテーマ
CakePHPのプラグインとしての開発を前提とし、plugins 配下内に配置する仕様とした。 `/plugins/bc-admin-third/`
詳細については、[BcAdminThirdの開発](https://github.com/baserproject/ucmitz/blob/dev/plugins/bc-admin-third/README.md) を参考にする。

なお、テーマの定義は、現在、`BaserCore\Controller\BcAdminAppController::beforeRender()` にて行っている。

### プラグイン
その他のプラグインも、plugins 配下内に配置する。
コアパッケージ、コアテーマ以外のロードは、管理画面でプラグインをインストールする事で利用可能となる。

## プラグインフォルダの命名

コアパッケージ、コアテーマ、コアプラグインについては、ハイフン区切り（dasherize）とし、その他のプラグインについては、アッパーキャメルケースとする。
```
例）
コア：baser-core / bc-admin-third / bc-blog
その他：BcSample
```
