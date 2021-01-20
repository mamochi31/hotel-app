require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe '#create' do
    before do
      @tag = FactoryBot.build(:tag)
    end

    it 'code、nameが存在すれば保存できる' do
      expect(@tag).to be_valid
    end

    it 'codeが空では保存できない' do
      @tag.code = nil
      @tag.valid?
      expect(@tag.errors.full_messages).to include('タグコードを入力してください', 'タグコードは不正な値です')
    end

    it 'codeが全角英数では保存できない' do
      @tag.code = 'ＡＢ１２'
      @tag.valid?
      expect(@tag.errors.full_messages).to include('タグコードは不正な値です')
    end

    it 'codeが重複していると保存できない' do
      @tag.save
      another_tag = FactoryBot.build(:tag, code: @tag.code, name: '千葉')
      another_tag.valid?
      expect(another_tag.errors.full_messages).to include('タグコードはすでに存在します')
    end

    it 'nameが空では保存できない' do
      @tag.name = nil
      @tag.valid?
      expect(@tag.errors.full_messages).to include('タグ名を入力してください')
    end

    it 'nameが重複していると保存できない' do
      @tag.save
      another_tag = FactoryBot.build(:tag, code: 'tko', name: @tag.name)
      another_tag.valid?
      expect(another_tag.errors.full_messages).to include('タグ名はすでに存在します')
    end
  end
end
