require 'faker'
require 'stackreduce/exceptions'
require 'active_model'

module Stackreduce
  class Seed

    class Seeduser
      include ActiveModel::Model
      attr_accessor :name, :city, :email, :country, :state
    end

    def self.seed_users(stack)
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
      Stackreduce.push(users, :stack=> stack)
    end
    
    
    
    class Seedproduct
      include ActiveModel::Model
      attr_accessor :name, :color, :duns_number, :company_name, :department
    end
    
    def self.seed_products(stack)
      products = []
      50.times do 
        users <<  Seeduser.new(
        :name=>Faker::Commerce.product_name,
        :color=>Faker::Commerce.color, 
        :duns_number=>Faker::Company.duns_number,
        :company_name=>Faker::Company.name,
        :department=>Faker::Commerce.department
        )
      end
      Stackreduce.push(products, :stack=> stack)
    end
    
    

    def self.seed(options)
      if options[:users]  
        seed_users(options[:users]) 
      elsif options[:products] 
        seed_products(options[:products]) 
      else
        seed_users("SEED EXAMPLE: Demo Users Stack")
      end
      end
    
    end
  end
