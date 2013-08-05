# Stackreduce

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'stackreduce'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stackreduce

Create generator:
	
    rails g stackreduce:config


Edit your config file:

    Stackreduce.configure do |config|
	  config.app_id = "YOU_APP_ID_HERE"
	  config.token = "YOU_APP_TOKEN"
	end

Push a new stack:

	Stackreduce.push User.all		

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
