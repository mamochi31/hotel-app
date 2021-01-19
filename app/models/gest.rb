class Gest < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  belongs_to :room_type, optional: true
  belongs_to :plan,      optional: true
  belongs_to :sex,       optional: true
  belongs_to :rank,      optional: true
  belongs_to :area,      optional: true

  # belongs_to :room, optional: true

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
    validates :room_type_id, :plan_id, :night, :adult, :number_of_room
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z|\A\z/ } do
    validates :name1_kana, :name2_kana, :name3_kana, :company_kana
  end

  validate :arr_date_check
  validate :dep_date_check

  def arr_date_check
    if arr_date.class != Date
      return
    elsif arr_date < Date.today
      errors.add(:arr_date, "に過去の日付は使用できません")
    end
  end

  def dep_date_check
    if night.class != Integer || arr_date.class != Date || dep_date.class != Date
      return
    elsif dep_date != arr_date + night
      errors.add(:dep_date, "または泊数の値が不正です")
    end
  end
end
