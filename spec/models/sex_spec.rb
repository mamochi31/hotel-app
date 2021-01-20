require 'rails_helper'

RSpec.describe Sex, type: :model do
  describe '#create' do
    before do
      @sex = FactoryBot.build(:sex)
    end

    it 'code、nameが存在すれば保存できる' do
      expect(@sex).to be_valid
    end

    it 'codeが空では保存できない' do
      @sex.code = nil
      @sex.valid?
      expect(@sex.errors.full_messages).to include('性別コードを入力してください', '性別コードは不正な値です')
    end

    it 'codeが全角英数では保存できない' do
      @sex.code = 'ＡＢ１２'
      @sex.valid?
      expect(@sex.errors.full_messages).to include('性別コードは不正な値です')
    end

    it 'codeが重複していると保存できない' do
      @sex.save
      another_sex = FactoryBot.build(:sex, code: @sex.code, name: '千葉')
      another_sex.valid?
      expect(another_sex.errors.full_messages).to include('性別コードはすでに存在します')
    end

    it 'nameが空では保存できない' do
      @sex.name = nil
      @sex.valid?
      expect(@sex.errors.full_messages).to include('性別名を入力してください')
    end

    it 'nameが重複していると保存できない' do
      @sex.save
      another_sex = FactoryBot.build(:sex, code: 'tko', name: @sex.name)
      another_sex.valid?
      expect(another_sex.errors.full_messages).to include('性別名はすでに存在します')
    end
  end
end
