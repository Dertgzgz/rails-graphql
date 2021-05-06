# Ruby

1. [RAILS](#RAILS)

   - [metaprogramacion-en-ruby-parte-1](https://vincentblog.xyz/posts/metaprogramacion-en-ruby-parte-1)

   - [metaprogramacion-en-ruby-parte-2](https://vincentblog.xyz/posts/metaprogramacion-en-ruby-parte-2)

   1.1 [Estructura](#Estructura)

2. [Preparando el entorno](#Preparando-el-entorno)
3. [Desde 0](#Desde-0)
4. [INFO (WVC)](#INFO-(WVC))
   1. [Tecnologias](#Tecnologias)
   2. [Puma](#Postgres)
   3. [Sidekiq](#Sidekiq)
   4. [ActiveStorage](#ActiveStorage-/-Persistence-in-S3)

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

## Preparando el entorno

0. [wsdl](https://docs.microsoft.com/es-es/windows/wsl/install-win10)
1. [Rvenv](https://github.com/rbenv/rbenv)
2. Docker - Para BBDD , Redis....
3. VisualStudioCode - plugins
   1. Ruby
   2. Ruby solargraph
   3. Ruby Rubocop
   4. Rails

### Ruby versions on system

update:

```bash
 cd ~/.rbenv/plugins/ruby-build
 git pull
```

## Rails Starters

### Rails CRUD con front

-[como-crear-un-crud-con-ruby-on-rails-6-y-bootstrap-4-parte-1](https://blog.nubecolectiva.com/como-crear-un-crud-con-ruby-on-rails-6-y-bootstrap-4-parte-1/)

```ruby
rails new crud -d=postgresql
# Middleware usado
bin/rails middleware
```

### Rails Api Only

- [Rails API-Only](https://guides.rubyonrails.org/api_app.html)

### Graphql-Ruby

- [Graphql - Ruby](https://www.howtographql.com/graphql-ruby/0-introduction/)
- [Ruby-GraphQl generators](https://graphql-ruby.org/schema/generators#graphqlinstall)

## Desde 0

- [Start](https://www.howtographql.com/graphql-ruby/1-getting-started/)

0. Creamos el proyecto

```ruby
rails new crud-graphql-api --skip-action-mailer --skip-action-mailbox --skip-action-text --skip-active-storage --skip-action-cable --skip-javascript --skip-system-test --skip-webpack-install -d=postgresql
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

3. `docker-compose -f docker-compose_postgres_redis.yml up`

4. Bundle install

5. GraphQl

    ```ruby
    rails g graphql:install
    bundle exec rails generate model User name:string email:string phone:string password:string
    rails g graphql:object UserType id:ID! name:String! email:String! phone:String! password:String!

    ```

### Credenciales De Aplicacion

Dejamos a rails que gestione los secretos de aplicacion.
Para desencriptar los secretos que usa la aplicacion :

`EDITOR="code --wait" rails credentials:edit` , \*code se refiere al editor

Este comando usa la clave presente en config/master.key para desencriptar el fichero credentials.yml.enc .

- _No se debe subir a git el fichero master.key_

## INFO (WVC)

- [GIT-Web Versia Cloud](https://github.com/VersiaSistemas/wvc-backend-n.git)

### Tecnologias

Una lista completa de la paqueteria usada se puede ver en el archivo [gemfile](gemfile)

| Tecnologia | version |
| ---------- | ------- |
| ruby       | 3.0.0   |
| rails      | 6.1.1   |
| puma       | 5.1.1   |
| Graph ql   |         |
| Postgres   |         |
| Redis      |         |
| Sideqik    |         |
| jekyll     | 4.2.0   |  |

---

### Puma

Puma es el servidor de desarrolo en el que se despliega la aplicacion
Su configuracion se controla desde `config/puma.rb`
`rails server` || `rails s`: arrancar
`rails restart` :reiniciar(si añadimos nuevas gemas)

Las rutas expuestas por este servidor se definen en [/config/ruotes.rb](/config/ruotes.rb)

### Postgres

Usamos Postgres como db relacional.

- generar una migracion `rails generate migration exampleMigration`

- delte all data from tables --> `rails db:truncate_all`

### Sidekiq

- [sidekiq.yml](https://mikerogers.io/2019/06/06/rails-6-sidekiq-queues)

Para acceder a la interfaz gráfica de Sidekiq, en la cual tendremos acceso a una mejor visualización de nuestros trabajos que se ejecutaron, se están ejecutando o se ejecutarán,
en config/routes.rb lo siguiente.

```ruby
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
```

Arrancar: ```bundle exec sidekiq -C config/sidekiq.yml -e development```

Para acceder leeremos las credenciales de .env

### Jekyll

Sitios estaticos con markdown

- [Start](https://www.sitepoint.com/jekyll-rails/)

- Añadir al gemfile :

```ruby
gem 'jekyll', '~> 4.2.0'
group :jekyll_plugins do
  gem "jekyll-feed"
  ##gem "jekyll-seo-tag"
end
```

- luego : `bundle exec jekyll new blog`
- We’ll leave most of these where they are, but we’re going to move \_config.yml into the Rails config directory and rename it : jekyll.yml

### ActiveStorage / Persistence in S3

Aqui almacenamos los tf_states asociados a cada contrato de VPS

- [info 1](https://medium.com/alturasoluciones/setting-up-rails-5-active-storage-with-amazon-s3-3d158cf021ff)

- [Activar active storage para attach](https://edgeguides.rubyonrails.org/active_storage_overview.html)

- Active Storage scheme
- ![IMG](https://pragmaticstudio.com/images/tutorials/using-active-storage-in-rails/polymorphic.jpg)


