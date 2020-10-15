# Railsy Url
Rails based url shortener

### Usage

1. Clone the repo
2. Run `bunde install`
3. Run `yarn install`
4. Set up the database: `bundle exec rails db:setup`
5. Execute the migrations: `bundle exec rails db:migrate`
6. Start the rails server: `bundle exec rails server`

Once you're on the homepage, you'll be presented with a form. Fill it with a url and clik on "Create Url"
The url will be saved, and a shortened version will be assigned to it.
You can then use the shortened URL to reach the original one
