class Word < ActiveRecord::Base
  has_many :memes
  belongs_to :group
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :definition, presence: true, length: { maximum: 140 }
end
