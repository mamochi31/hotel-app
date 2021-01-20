require 'rails_helper'

RSpec.describe RoomType, type: :model do
  describe '#create' do
    before do
      @room_type = FactoryBot.build(:room_type)
    end

    it 'code、name、capacityが存在すれば保存できる' do
      expect(@room_type).to be_valid
    end

    it 'codeが空では保存できない' do
      @room_type.code = nil
      @room_type.valid?
      expect(@room_type.errors.full_messages).to include('部屋タイプコードを入力してください', '部屋タイプコードは不正な値です')
    end

    it 'codeが全角英数では保存できない' do
      @room_type.code = 'ＡＢ１２'
      @room_type.valid?
      expect(@room_type.errors.full_messages).to include('部屋タイプコードは不正な値です')
    end

    it 'codeが重複していると保存できない' do
      @room_type.save
      another_room_type = FactoryBot.build(:room_type, code: @room_type.code, name: '重複')
      another_room_type.valid?
      expect(another_room_type.errors.full_messages).to include('部屋タイプコードはすでに存在します')
    end

    it 'nameが空では保存できない' do
      @room_type.name = nil
      @room_type.valid?
      expect(@room_type.errors.full_messages).to include('部屋タイプ名を入力してください')
    end

    it 'nameが重複していると保存できない' do
      @room_type.save
      another_room_type = FactoryBot.build(:room_type, code: 'tko', name: @room_type.name)
      another_room_type.valid?
      expect(another_room_type.errors.full_messages).to include('部屋タイプ名はすでに存在します')
    end

    it 'capacityが空では保存できない' do
      @room_type.capacity = nil
      @room_type.valid?
      expect(@room_type.errors.full_messages).to include('定員を入力してください')
    end

    it 'capacityが全角数字では保存できない' do
      @room_type.capacity = '６０００'
      @room_type.valid?
      expect(@room_type.errors.full_messages).to include('定員は数値で入力してください')
    end
  end
end
