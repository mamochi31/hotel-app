class Gest < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # belongs_to :room_type
  # belongs_to :plan
  belongs_to :sex,  optional: true
  # belongs_to :rank, optional: true
  # belongs_to :room, optional: true
  # belongs_to :area, optional: true

  # has_many :gests_rooms
  # has_many :rooms, through: :gests_rooms
  # has_many :gests_tags
  # has_many :tags, through: :gests_tags

  with_options presence: true do
    validates :name1_kana, :phone_number, :arr_date, :dep_date, :night, :adult, :number_of_room
  end

  validates :sex_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }, allow_nil: true
end
