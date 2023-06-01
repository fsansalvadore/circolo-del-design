# Circolo Del Design

The club is a pillar of the Italian design scene. This website lets them communicate with the public and promote their cultural offer.

[Live Preview](https://www.circolodeldesign.it/)

![Circolo del Design Preview](https://www.fsansalvadore.com/assets/CircoloDelDesign-Website-Preview.gif)

## Development

```bash
yarn install
bundle install
rails db:migrate
rails db:seed # if starting from an empty db
rails s
```

## Technologies

- Ruby on Rails
- PostgreSQL
- HTML5
- SCSS
- Heroku
- Cloudinary

## Troubleshooting

- [Postgres connection failed](#postgres-connection-failed)
- [javascript_pack_tag doesn't load](#javascript_pack_tag-doesnt-load)

### Postgres connection failed

connection to server on socket "/tmp/.s.PGSQL.5432" failed: No such file or directory Is the server running locally and accepting connections on that socket?

```
### Convenience alias for PG::Connection.new.
def self::connect( *args )
  return PG::Connection.new( *args )
end
```

Related issues:

[https://stackoverflow.com/questions/13410686/postgres-could-not-connect-to-server](https://stackoverflow.com/questions/13410686/postgres-could-not-connect-to-server)
[https://dba.stackexchange.com/questions/75214/postgresql-not-running-on-mac](https://dba.stackexchange.com/questions/75214/postgresql-not-running-on-mac)

#### Solution:

```bash
brew services stop postgresql
brew postgresql-upgrade-database
brew services start postgresql
```

### javascript_pack_tag doesn't load

`Rack app ("GET /packs/js/application-eaa6cc091e6d5646d5c6.js" - (::1)): #<EOFError: end of file reached>`

Related issues:
(https://stackoverflow.com/questions/62046530/using-javascript-pack-tag-in-rails-causes-eoferror)[https://stackoverflow.com/questions/62046530/using-javascript-pack-tag-in-rails-causes-eoferror]

#### Solution:

Sometimes `javascript_pack_tag` doesn't load correctly when another Rails app is running (also in Docker).
To fix this, stop the other app or container.
