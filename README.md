# Stackreduce

TODO: Rails API Wrapper for [Stackreduce.com](http://www.stackreduce.com/)
## Installation

Add this line to your application's Gemfile:

    gem 'stackreduce'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stackreduce

Create generator:
	
    $ rails g stackreduce:config


Edit your config file:

    Stackreduce.configure do |config|
	  config.app_id = "YOUR_APP_ID"
	  config.token = "YOUR_APP_TOKEN"
	end

## Usage
Push a new stack:

	Stackreduce.push User.all		
	Push a new stack:
Or create a stack with a name:

	Stackreduce.push User.all, :name => "My awesome stack"

## Tested with
	Rails 4.0.0
	ruby 2.0.0p195 (2013-05-14 revision 40734) [x86_64-darwin12.3.0]
	
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
