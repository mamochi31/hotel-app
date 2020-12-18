class CreateGests < ActiveRecord::Migration[6.0]
  def change
    create_table :gests do |t|
      t.string     :name1_kana, null: false
      t.string     :name1_kanji
      t.string     :name2_kana
      t.string     :name2_kanji
      t.string     :name3_kana
      t.string     :name3_kanji
      t.string     :memo
      t.string     :company_kana
      t.string     :company_kanji
      t.string     :phone_number, null: false
      t.string     :remark
      t.date       :arr_date, null: false
      t.date       :dep_date, null: false
      t.integer    :night, null: false
      t.integer    :adult, null: false
      t.integer    :child
      t.integer    :baby
      t.integer    :number_of_room, null: false
      t.integer    :sex_id
      # t.references :rank
      # t.references :room_type, null: false
      # t.references :room
      # t.references :plan,      null: false
      # t.references :area
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
