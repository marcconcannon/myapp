class Customer < ApplicationRecord
  has_many :users
  belongs_to :plan
end
