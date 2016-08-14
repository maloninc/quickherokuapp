# Why?
I think sometimes it is very efficient way to have commercial cloud system compared with developing in-house systems.
Our company policy is commercial-cloud-first. However sometimes it is faster to develop small batch programs, data converting programs by ourselves.
To do that, I don't use internal server, instead to use Heroku and quickly develop them. During this I made a kind of template system.

# Why Docker
Because it is the best way not to mess up my Mac environment.
Especially when I upgraded my Mac, which means some runtime environment such as Ruby has to be changed, it was really troublesome. Therefore I decided to use Docker to emulate Heroku environment.

# My development environment
- Personal[Macbook](http://www.apple.com/jp/macbook/)（Our company support BYOD）
- OS X El Capitan (10.11.6)
- Docker for Mac (I've been using Docker Toolbox)

# Usage

```
git@github.com:maloninc/quickherokuapp.git
cd quickherokuapp
rake
```

Access http://localhost:9292  by your browser, the you will see the following screen.

![スクリーンショット 2016-08-06 13.08.38.png](https://qiita-image-store.s3.amazonaws.com/0/96599/a16799d8-dcf9-51e7-333e-3061c2eee341.png)

After that you can modify anything you want.

# Structure of the template
```
- Dockerfile
- Gemfile
- Rakefile

# These are for Sinatara
- app.rb
- configu.ru
- env
+ public
  + css
    - app.css
  + js
    - app.js
- resources.rb
+ views
  - index.haml
```

## Dockerfile
Importing Heroku official image of `cedar` stack by calling `FROM heroku/cedar:14`, and installing ruby's buildpack.

## Gemfile
Installing gems for Sinatra + Datamapper application. Database is SQLite in local ,and PostgreSQL in production.

## Rakefile
Because I can't memorize all `docker` commands, I made Rakefile to make the following shortcuts.

- Launch web application : rake
- Run as a job : rake run_job
- Go to shell : rake shell
