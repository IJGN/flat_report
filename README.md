# WIP 開発中

---

# Flat Report

チームの日報管理をするWebAppです。

#### _DEMO:_

準備中...

## Getting Started

サーバサイド、クライアントサイドともにRuby on Railsで実装しています。開発端末はMacを想定しています。DBはpostgreSQLを使用しています。

### Prerequisites

YarnとRbenvを使用するので、事前にインストールが必要です。

```
$ brew update
$ brew install yarn
$ rbenv local 2.4.2
$ gem install bundler
```

### Installing

プロジェクトをCloneまたはForkしたら初期設定をします。

```
$ git clone # or fork your repository
$ bundle install --path vendor/bundle --jobs 4
$ yarn install
$ bin/rails db:create db:migrate
$ bin/rails s
```

初期データを挿入します。

```
$ bin/rails db:seed
```

プロジェクトルート直下にER図を生成します。

```
bin/rails erd attributes=foreign_keys,primary_keys,content filename=erd filetype=png
```


サーバを起動してアクセスするとDEMOのような画面が表示されると思います。

## Running the tests

準備中...

### Break down into end to end tests

準備中...

```
Give an example
```

### And coding style tests

準備中...

```
Give an example
```

## Deployment

準備中...

## Built With

準備中...

<!-- * [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds -->

## Contributing

準備中...

<!-- Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.
 -->

## Versioning

準備中...

<!-- We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). -->

## Authors

準備中...

<!-- * **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project. -->

## License

準備中...

<!-- This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details -->

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc
