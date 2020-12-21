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
      t.string     :sex_id
      t.string     :rank_id
      t.string     :room_type_id, null: false
      t.date       :arr_date, null: false
      t.date       :dep_date, null: false
      t.integer    :night, null: false
      t.integer    :adult, null: false
      t.integer    :child
      t.integer    :baby
      t.integer    :number_of_room, null: false
      # t.integer :room
      # t.string  :plan,      null: false
      # t.string  :area
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
