class Rank < ApplicationRecord
  has_many :gests

  with_options presence: true, uniqueness: true do
    validates :code, :name
  end
end
