class Project < ApplicationRecord
  has_many :users
  belongs_to :customer
end
