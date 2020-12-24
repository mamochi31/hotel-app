class Plan < ApplicationRecord
  has_many :gests

  with_options presence: true do
    validates :code, :name, :price
  end

  with_options uniqueness: true do
    validates :code, :name
  end
end
