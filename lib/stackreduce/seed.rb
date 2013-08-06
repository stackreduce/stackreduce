require 'faker'
require 'stackreduce/exceptions'
require 'active_model'

module Stackreduce
  class Seed

    class Seeduser
      include ActiveModel::Model
      attr_accessor :name, :city, :email, :country, :state
    end

    def self.seed_users(name)
      users = []
      50.times do 
        users <<  Seeduser.new(
        :name=>Faker::Name.name,
        :city=>Faker::Address.city, 
        :country=>Faker::Address.country,
        :state=>Faker::Address.state,
        :email=>Faker::Internet.email
        )
      end
      Stackreduce.push(users, :name=> name)
    end

    def self.seed(options)
      seed_users(options[:users]) if options[:users] 
    end
  end
end
