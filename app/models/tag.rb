class Tag < ApplicationRecord
  has_many :gest_tags
  has_many :gests, through: :gest_tags

  # has_many :room_type_tags
  # has_many :rooms, through: :room_type_tags

  # has_many :room_tags
  # has_many :rooms, through: :room_tags

  with_options presence: true, uniqueness: { case_sensitive: true } do
    validates :code, :name
  end

  with_options format: { with: /\A[a-z0-9]+\z/ } do
    validates :code
  end
end
