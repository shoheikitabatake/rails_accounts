# rails_accounts

######ファイル生成

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

######bootstrap適用
```
$ rails g bootstrap:themed Posts -f
```

######ルーティングの確認
```
$ rake routes
```

######テーブル構造変更
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
