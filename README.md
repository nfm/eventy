# Eventy

Super simple event tracking in Rails. Record arbitrary events, associate them with a user or account, and record any associated properties.

Currently, Eventy ships with two backends: `active_record`, and `active_record_hstore`.

## Installation

Add this line to your application's Gemfile:

    gem 'eventy'

And then execute:

    $ bundle

Next, run the Rails generator to create a migration for your desired backend (either `active_record` or `active_record_hstore`):

    $ bundle exec rails generate eventy:active_record

You may need to modify this migration. Then run the migration:

    $ bundle exec rake db:migrate

Finally, configure eventy to use your preferred backend:

    # config/initializers/eventy.rb
    Eventy.configure(backend: :active_record)

## Usage

Record events by calling `Eventy.record(event_name, unique_identifier, attributes)`:

    Eventy.record('account:signup', session[:unique_id], { referrer: 'Facebook' })
    Eventy.record('response:create', current_account.unique_id)
    Eventy.record('response:create', current_account.unique_id)

You can name your events however you like, associate them with whatever unique identifier you like, and assign them arbitrary properties. Simple.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
