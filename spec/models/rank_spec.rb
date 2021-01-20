require 'rails_helper'

RSpec.describe Rank, type: :model do
  describe '#create' do
    before do
      @rank = FactoryBot.build(:rank)
    end
  
    it 'code、nameが存在すれば保存できる' do
      expect(@rank).to be_valid
    end

    it 'codeが空では保存できない' do
      @rank.code = nil
      @rank.valid?
      expect(@rank.errors.full_messages).to include('ランクコードを入力してください', 'ランクコードは不正な値です')
    end

    it 'codeが全角英数では保存できない' do
      @rank.code = 'ＡＢ１２'
      @rank.valid?
      expect(@rank.errors.full_messages).to include('ランクコードは不正な値です')
    end

    it 'codeが重複していると保存できない' do
      @rank.save
      another_rank = FactoryBot.build(:rank, code: @rank.code, name: '重複')
      another_rank.valid?
      expect(another_rank.errors.full_messages).to include('ランクコードはすでに存在します')
    end

    it 'nameが空では保存できない' do
      @rank.name = nil
      @rank.valid?
      expect(@rank.errors.full_messages).to include('ランク名を入力してください')
    end

    it 'nameが重複していると保存できない' do
      @rank.save
      another_rank = FactoryBot.build(:rank, code: 'tko', name: @rank.name)
      another_rank.valid?
      expect(another_rank.errors.full_messages).to include('ランク名はすでに存在します')
    end
  end
end
