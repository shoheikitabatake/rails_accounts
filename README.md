# rails_accounts

### 概要

- 個人用家計簿です。
- 資産、負債、収入、支出の大項目に科目を設定できます。
- ストックを表す`残高`（バランスシートのイメージ）と、フローを表す`収支`（損益計算書のイメージ）が表示できます。

### 画面イメージ

- ログイン（用途に合わせてユーザーを分けることが可能です。）
![2017-05-15 15 47 09](https://cloud.githubusercontent.com/assets/11205591/26045768/aaf0d50e-3986-11e7-95e9-74d5924c615b.png)
- 取引履歴（過去のお金の変動履歴がわかります。）
![2017-05-15 15 50 13](https://cloud.githubusercontent.com/assets/11205591/26045770/acae67da-3986-11e7-9990-2c1ba1fb295a.png)
- 仕訳入力（お金が動いた時に入力しましょう。）
![2017-05-15 15 50 47](https://cloud.githubusercontent.com/assets/11205591/26045772/adfc6eac-3986-11e7-8a36-96ff76e87f47.png)
- 残高（`現在`の資産、負債の項目と金額がわかります。）
![2017-05-15 15 51 26](https://cloud.githubusercontent.com/assets/11205591/26045774/af3493c6-3986-11e7-9b7c-31d223ca0917.png)
- 月ごとの収入、支出の項目と金額がわかります。
![2017-05-15 15 51 58](https://cloud.githubusercontent.com/assets/11205591/26045775/b0a42366-3986-11e7-8cae-501544f5a1c5.png)
- 勘定科目設定
  - 例えば資産項目に`現金`や`A口座預金`を追加できます。
- プロフィール設定
  - ログインアイパスの変更ができます。
![2017-05-15 15 52 17](https://cloud.githubusercontent.com/assets/11205591/26045779/b2217bbc-3986-11e7-933d-e18a782aaa3b.png)

---

### 使い方

#### ファイル生成

MVC作成

```
$ rails g scaffold post uid:integer type:string post_date:datetime
# DBをマイグレーション
$ rake db:migrate
```

VC作成（テーブルは不要の場合）

```
$ rails g controller post
# 作成したアクションにrouteを設定
$ vi config/routes.rb
+  get 'post/index'

```

#### bootstrap適用

```
$ rails g bootstrap:themed Posts -f
```

#### ルーティングの確認

```
$ rake routes
```

#### テーブル構造変更

型変更

```
$ rails g migration change_datatype_{column}_of_{table}
  def change
    # [形式] change_column(テーブル名, カラム名, データタイプ, オプション)
    change_column :{table}, :{column}, :{型}
$ rake db:migrate
```

カラム名変更
```
$ rails g migration rename_{column}_column_to_{table}
  def change
    # [形式] rename_column(テーブル名, 変更前カラム名, 変更後カラム名)
    rename_column :{table}, :{変更前カラム名}, :{変更後カラム名}
$ rake db:migrate
