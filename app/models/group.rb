class Group < ActiveRecord::Base
  has_many :words
  has_many :memes, through: :words
  # has_many :users, through: :words
  has_many    :subscriptions
  has_many    :users, through: :subscriptions

  validates :name, presence: true, length: { maximum: 25 },
            uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 140 }, allow_blank: true

  mount_uploader :group_pic, GroupImageUploader
end
