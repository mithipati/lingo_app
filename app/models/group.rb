class Group < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 25 },
            uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 140 }
end
