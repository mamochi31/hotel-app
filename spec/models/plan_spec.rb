require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe '#create' do
    before do
      @plan = FactoryBot.build(:plan)
    end

    it 'code、name、priceが存在すれば保存できる' do
      expect(@plan).to be_valid
    end

    it 'codeが空では保存できない' do
      @plan.code = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include('プランコードを入力してください', 'プランコードは不正な値です')
    end

    it 'codeが全角英数では保存できない' do
      @plan.code = 'ＡＢ１２'
      @plan.valid?
      expect(@plan.errors.full_messages).to include('プランコードは不正な値です')
    end

    it 'codeが重複していると保存できない' do
      @plan.save
      another_plan = FactoryBot.build(:plan, code: @plan.code, name: '重複')
      another_plan.valid?
      expect(another_plan.errors.full_messages).to include('プランコードはすでに存在します')
    end

    it 'nameが空では保存できない' do
      @plan.name = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include('プラン名を入力してください')
    end

    it 'nameが重複していると保存できない' do
      @plan.save
      another_plan = FactoryBot.build(:plan, code: 'tko', name: @plan.name)
      another_plan.valid?
      expect(another_plan.errors.full_messages).to include('プラン名はすでに存在します')
    end

    it 'priceが空では保存できない' do
      @plan.price = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include('単価を入力してください')
    end

    it 'priceが全角数字では保存できない' do
      @plan.price = '６０００'
      @plan.valid?
      expect(@plan.errors.full_messages).to include('単価は数値で入力してください')
    end
  end
end
