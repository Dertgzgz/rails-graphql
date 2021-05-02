# Ruby

- [metaprogramacion-en-ruby-parte-1](https://vincentblog.xyz/posts/metaprogramacion-en-ruby-parte-1)

- [metaprogramacion-en-ruby-parte-2](https://vincentblog.xyz/posts/metaprogramacion-en-ruby-parte-2)

## RAILS

- [BASE](https://api.rubyonrails.org/)

### Estructura

| File/Folder         | Purpose                                                                                                                                                                                                                                                                    |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| app/                | Contains the controllers, models, views, helpers, mailers, channels, jobs, and assets for your application. You'll focus on this folder for the remainder of this guide.                                                                                                   |
| bin/                | Contains the rails script that starts your app and can contain other scripts you use to set up, update, deploy, or run your application.                                                                                                                                   |
| config/             | Contains configuration for your application's routes, database, and more. This is covered in more detail in Configuring Rails Applications.                                                                                                                                |
| config.ru           | Rack configuration for Rack-based servers used to start the application. For more information about Rack, see the Rack website.                                                                                                                                            |
| db/                 | Contains your current database schema, as well as the database migrations.                                                                                                                                                                                                 |
| GemfileGemfile.lock | These files allow you to specify what gem dependencies are needed for your Rails application. These files are used by the Bundler gem. For more information about Bundler, see the Bundler website.                                                                        |
| lib/                | Extended modules for your application.                                                                                                                                                                                                                                     |
| log/                | Application log files.                                                                                                                                                                                                                                                     |
| package.json        | This file allows you to specify what npm dependencies are needed for your Rails application. This file is used by Yarn. For more information about Yarn, see the Yarn website.                                                                                             |
| public/             | Contains static files and compiled assets. When your app is running, this directory will be exposed as-is.                                                                                                                                                                 |
| Rakefile            | This file locates and loads tasks that can be run from the command line. The task definitions are defined throughout the components of Rails. Rather than changing Rakefile, you should add your own tasks by adding files to the lib/tasks directory of your application. |
| README.md           | This is a brief instruction manual for your application. You should edit this file to tell others what your application does, how to set it up, and so on.                                                                                                                 |
| storage/            | Active Storage files for Disk Service. This is covered in Active Storage Overview.                                                                                                                                                                                         |
| test/               | Unit tests, fixtures, and other test apparatus. These are covered in Testing Rails Applications.                                                                                                                                                                           |
| tmp/                | Temporary files (like cache and pid files).                                                                                                                                                                                                                                |
| vendor/             | A place for all third-party code. In a typical Rails application this includes vendored gems.                                                                                                                                                                              |
| .gitignore          | This file tells git which files (or patterns) it should ignore. See GitHub - Ignoring files for more info about ignoring files.                                                                                                                                            |
| .ruby-version       | This file contains the default Ruby version.                                                                                                                                                                                                                               |

### Rails CRUD con front

-[como-crear-un-crud-con-ruby-on-rails-6-y-bootstrap-4-parte-1](https://blog.nubecolectiva.com/como-crear-un-crud-con-ruby-on-rails-6-y-bootstrap-4-parte-1/)

```ruby
rails new crud -d=postgresql
# Middleware usado
bin/rails middleware
```

### Rails Api Only Graph ql

- [Rails API-Only](https://guides.rubyonrails.org/api_app.html)
- [Graphql](https://www.howtographql.com/)
- [Graphql - Ruby](https://www.howtographql.com/graphql-ruby/0-introduction/)

0. Creamos el proyecto

```ruby
rails new crud-api --skip-action-mailer --skip-action-mailbox --skip-action-text --skip-active-storage --skip-action-cable --skip-javascript --skip-system-test --skip-webpack-install
cd crud-api
bundle exec rails db:create
bundle exec rails server
# Middleware usado
bin/rails middleware
```

1. Añadimos al gemfile


```ruby
group :development do
....
  gem 'solargraph', require: false
  #gem 'ruby-debug-ide', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

gem 'graphql'
gem 'dotenv-rails', require: 'dotenv/rails-now'

```

2. Añadimos los parametros de conexion en el .env

3. Bundle install

4. GraphQl

```ruby
rails g graphql:install
bundle exec rails generate model User name:string email:string phone:string password:string
rails g graphql:object UserType id:ID! name:String! email:String! phone:String! password:String!




```

### Graphql-Ruby

- [graphqleditor](https://graphqleditor.com/graphql)

- [generators](https://graphql-ruby.org/schema/generators#graphqlinstall)

- [Start](https://www.howtographql.com/graphql-ruby/1-getting-started/)

## entorno desarrollo

0. wsdl
1. [Rvenv](https://github.com/rbenv/rbenv)

### Ruby versions

```bash
 cd ~/.rbenv/plugins/ruby-build
 git pull
```
