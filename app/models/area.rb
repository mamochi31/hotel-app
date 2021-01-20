class Area < ApplicationRecord
  has_many :gests

  with_options presence: true, uniqueness: { case_sensitive: true } do
    validates :code, :name
  end

  with_options format: { with: /\A[a-z0-9]+\z/ } do
    validates :code
  end
end
