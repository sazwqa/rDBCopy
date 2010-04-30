class User < ActiveRecord::Base
  
  attr_accessor :save_to_production
  
  validates_presence_of :name
  
end