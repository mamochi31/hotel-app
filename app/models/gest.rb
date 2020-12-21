class Gest < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :room_type
  belongs_to :plan

  belongs_to :sex,  optional: true
  belongs_to :rank, optional: true
  # belongs_to :room, optional: true
  belongs_to :area, optional: true

  # has_many :gests_rooms
  # has_many :rooms, through: :gests_rooms
  # has_many :gests_tags
  # has_many :tags, through: :gests_tags

  with_options presence: true do
    validates :name1_kana, :phone_number, :arr_date, :dep_date, :night, :adult, :number_of_room
  end

  with_options numericality: { only_integer: true }, allow_nil: true do
    validates :sex_id, :rank_id, :area_id
  end

  with_options numericality: { only_integer: true } do
    validates :room_type_id, :plan_id
  end
end
