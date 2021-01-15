require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'name、email、password、password_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nameが空では登録できない' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('名前を入力してください')
    end

    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'passwordが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください', 'パスワードは不正な値です')
    end

    it 'passwordが全角英数字では登録できない' do
      @user.password = 'ＡＢＣ１２３'
      @user.password_confirmation = 'ＡＢＣ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end

    it 'passwordが5文字以下であれば登録できない' do
      @user.password = 'ab123'
      @user.password_confirmation = 'ab123'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください', 'パスワードは不正な値です')
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'aaa111'
      @user.password_confirmation = 'bbb222'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
  end
end
