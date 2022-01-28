# 予約管理API
### バージョン
- python 3.8.12
- Django 3.2.11
- nginx 1.15.12
- postgres 14.1

### 設定
1. プロジェクトのクローン

2. `env`ファイルの作成
```zsh
$ mkdir env
$ touch env/.env.app
$ touch env/.env.db
```

`.env.app`
| key | value(default) |
| :-- | :-- |
|DEBUG|0|
|SECRET_KEY|*SECRET_KEYを再生成|
|DATABASE_ENGINE|django.db.backends.postgresql|
|POSTGRES_NAME|django_db|
|DATABASE_USER|django_db_user|
|DATABASE_PASSWORD|password|
|DATABASE_HOST|db|
|DATABASE_PORT|5432|

*SECRET_KEYを再生成
```zsh
$ cd app/config
$ python get_random_secret_key.py
or
$ docker-compose exec app cd config && python get_random_secret_key.py
```

`.env.db`
| key | value(default) |
| :-- | :-- |
|POSTGRES_NAME|django_db|
|POSTGRES_USER|django_db_user|
|POSTGRES_PASSWORD|password|
|TZ|Asia/Tokyo|
|PGADMIN_DEFAULT_EMAIL|aaa@bbb.ccc|
|PGADMIN_DEFAULT_PASSWORD|password|

3. 仮想化環境の作成と起動
```zsh
$ docker-compose up -d --build
```

4. マイグレートを実行します
```zsh
$ docker-compose exec app python manage.py migrate --noinput
```

5. 静的ファイルは、STATIC_ROOTで指定されたパスに収集されます
```zsh
$ docker-compose exec app python manage.py collectstatic --no-input --clear
```

6. ローカル環境で`http：// localhost / admin /`にアクセスします

### データベースを再構築する
1. 仮想化環境を終了します
2. 仮想化環境とデータベースにデータを格納しているボリュームを削除します

```zsh
$ docker-compose down -v
```

3. 仮想化環境を再作成する

```zsh
$ docker-compose up -d --build
```