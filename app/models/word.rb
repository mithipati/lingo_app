class Word < ActiveRecord::Base
  has_many :memes
  belongs_to :group
  belongs_to :user
  validates :name, presence: true, length: { maximum: 25 },
            format: { with: /\A[a-zA-Z]+\z/, message: "for word only allows letters" }
  validates :definition, presence: true, length: { maximum: 140 }
end
