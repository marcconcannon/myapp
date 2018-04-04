class Project < ApplicationRecord

  has_many :users
  belongs_to :customer

  before_save {self.title_unique = title_unique.downcase }
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :title_unique, presence: true, uniqueness: true 


end
