class Word < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  validates :name, presence: true, length: { maximum: 15 },
            format: { with: /\A[a-zA-Z]+\z/, message: "Sorry, only allows letters." }
  validates :definition, presence: true, length: { maximum: 140 }
end
