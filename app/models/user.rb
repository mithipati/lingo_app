class User < ActiveRecord::Base
  has_many :words
  has_many :groups, through: :words
end
