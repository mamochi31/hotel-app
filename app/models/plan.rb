class Plan < ApplicationRecord
  has_many :gests

  with_options presence: true do
    validates :code, :name, :price
  end

  with_options uniqueness: { case_sensitive: true } do
    validates :code, :name
  end

  with_options format: { with: /\A[a-z0-9]+\z/ } do
    validates :code
  end

  with_options numericality: { only_integer: true } do
    validates :price
  end 
end
