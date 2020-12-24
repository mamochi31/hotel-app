class Gest < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :room_type
  belongs_to :plan

  belongs_to :sex,  optional: true
  belongs_to :rank, optional: true
  # belongs_to :room, optional: true
  belongs_to :area, optional: true

  # has_many :gest_rooms
  # has_many :rooms, through: :gest_rooms
  has_many :gest_tags, dependent: :destroy
  has_many :tags, through: :gest_tags

  with_options presence: true do
    validates :name1_kana, :phone_number, :arr_date, :dep_date, :night, :adult, :number_of_room
  end

  with_options numericality: { only_integer: true }, allow_nil: true do
    validates :sex_id, :rank_id, :area_id
  end

  with_options numericality: { only_integer: true } do
    validates :room_type_id, :plan_id
  end

  def self.name_search(search)
    if search != ""
      Gest.where('name1_kana LIKE(?)', "%#{search}%")
    end
  end

end
