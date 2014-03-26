class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # has_many :words
  # has_many :groups, through: :words

  has_many  :subscriptions
  has_many  :groups, through: :subscriptions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :profile_pic, ImageUploader


  def find_words(group)
    group.each do |single_group|
      puts single_group.words
    end
  end
end
