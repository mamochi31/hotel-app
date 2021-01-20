require 'rails_helper'

RSpec.describe Area, type: :model do
  describe '#create' do
    before do
      @area = FactoryBot.build(:area)
    end

    it 'code、nameが存在すれば保存できる' do
      expect(@area).to be_valid
    end

    it 'codeが空では保存できない' do
      @area.code = nil
      @area.valid?
      expect(@area.errors.full_messages).to include('地域コードを入力してください', '地域コードは不正な値です')
    end

    it 'codeが全角英数では保存できない' do
      @area.code = 'ＡＢ１２'
      @area.valid?
      expect(@area.errors.full_messages).to include('地域コードは不正な値です')
    end

    it 'codeが重複していると保存できない' do
      @area.save
      another_area = FactoryBot.build(:area, code: @area.code, name: '千葉')
      another_area.valid?
      expect(another_area.errors.full_messages).to include('地域コードはすでに存在します')
    end

    it 'nameが空では保存できない' do
      @area.name = nil
      @area.valid?
      expect(@area.errors.full_messages).to include('地域名を入力してください')
    end

    it 'nameが重複していると保存できない' do
      @area.save
      another_area = FactoryBot.build(:area, code: 'tko', name: @area.name)
      another_area.valid?
      expect(another_area.errors.full_messages).to include('地域名はすでに存在します')
    end
  end
end
