class Tag < ApplicationRecord
  has_many :gest_tags
  has_many :gests, through: :gest_tags

  # has_many :room_type_tags
  # has_many :rooms, through: :room_type_tags

  # has_many :room_tags
  # has_many :rooms, through: :room_tags

  with_options presence: true, uniqueness: true do
    validates :code, :name
  end
end
