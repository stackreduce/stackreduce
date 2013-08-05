# Stackreduce
Stackreduce gem its a Rails API Wrapper for [Stackreduce.com](http://www.stackreduce.com/)
A simple solutions for pushing your data from your rails app

### RDocs

You can view the Stackreduce documentation in RDoc format here:

http://rubydoc.info/github/stackreduce/stackreduce/master/frames


### Issue tracker
https://github.com/stackreduce/stackreduce/issues

## Installation
You can add it to your Gemfile:

    gem 'stackreduce'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stackreduce

## Generator
Create generator:
	
    $ rails g stackreduce:config

It will create a config file under your 

	config/initializers/stackreduce_config.rb

Edit your config file and add your applications id and token:

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



http://rubydoc.info/github/stackreduce/stackreduce/master/frames

## Tested with
	Rails 4.0.0
	ruby 2.0.0p195 (2013-05-14 revision 40734) [x86_64-darwin12.3.0]
	
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
