require 'rails_helper'

RSpec.describe Gest, type: :model do
  describe '#create' do
    before do
      @gest = FactoryBot.build(:gest)
    end

    it 'name1_kana、phone_number、arr_date、night、dep_date、adult、number_of_room、room_type_id、plan_id、が入力されていれば登録ができる' do
      expect(@gest).to be_valid
    end

    it 'name1_kanaが空では登録できない' do
      @gest.name1_kana = nil
      @gest.valid?
      expect(@gest.errors.full_messages).to include('ゲスト１の名前を入力してください')
    end

    it 'name1_kanaがひらがなでは登録できない' do
      @gest.name1_kana = 'やまだたろう'
      @gest.valid?
      expect(@gest.errors.full_messages).to include('ゲスト１の名前は不正な値です')
    end

    it 'name1_kanaが漢字では登録できない' do
      @gest.name1_kana = '山田太郎'
      @gest.valid?
      expect(@gest.errors.full_messages).to include('ゲスト１の名前は不正な値です')
    end

    it 'name1_kanaがアルファベットでは登録できない' do
      @gest.name1_kana = 'yamadatarou'
      @gest.valid?
      expect(@gest.errors.full_messages).to include('ゲスト１の名前は不正な値です')
    end

    it 'phone_numberが空では登録できない' do
      @gest.phone_number = nil
      @gest.valid?
      expect(@gest.errors.full_messages).to include('電話番号を入力してください')
    end

    it 'arr_dateが空では登録できない' do
      @gest.arr_date = nil
      @gest.valid?
      expect(@gest.errors.full_messages).to include('到着日を入力してください')
    end

    it 'arr_dateが過去日では登録できない' do
      @gest.arr_date = '2020-01-01'
      @gest.valid?
      expect(@gest.errors.full_messages).to include('到着日に過去の日付は使用できません', '出発日または泊数の値が不正です')
    end

    it 'nightが空では登録できない' do
      @gest.night = nil
      @gest.valid?
      expect(@gest.errors.full_messages).to include('泊数を入力してください')
    end

    it 'nightが全角数字では登録できない' do
      @gest.night = '１'
      @gest.valid?
      expect(@gest.errors.full_messages).to include('泊数は数値で入力してください', '出発日または泊数の値が不正です')
    end

    it 'adultが空では保存できない' do
      @gest.adult = nil
      @gest.valid?
      expect(@gest.errors.full_messages).to include('大人を入力してください')
    end

    it 'adultが全角数字では保存できない' do
      @gest.adult = '１'
      @gest.valid?
      expect(@gest.errors.full_messages).to include('大人は数値で入力してください')
    end

    it 'number_of_roomが空では保存できない' do
      @gest.number_of_room = nil
      @gest.valid?
      expect(@gest.errors.full_messages).to include('室数を入力してください')
    end

    it 'number_of_roomが全角数字では保存できない' do
      @gest.number_of_room = '１'
      @gest.valid?
      expect(@gest.errors.full_messages).to include('室数は数値で入力してください')
    end

    it 'room_type_idが空では保存できない' do
      @gest.room_type_id = nil
      @gest.valid?
      expect(@gest.errors.full_messages).to include('部屋タイプは数値で入力してください')
    end

    it 'plan_idが空では保存できない' do
      @gest.plan_id = nil
      @gest.valid?
      expect(@gest.errors.full_messages).to include('プランは数値で入力してください')
    end
  end
end
