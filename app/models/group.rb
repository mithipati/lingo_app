class Group < ActiveRecord::Base
  has_many :words
  has_many :users, through: :words
  validates :name, presence: true, length: { maximum: 25 },
            uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 140 }, allow_blank: true
end
