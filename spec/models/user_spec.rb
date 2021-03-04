require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '登録成功時' do
      it 'nicknameとemail、password、password_confirmation、last_name、first_name
          が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it '重複したemailがなければ登録できる' do
        @user.email = 'aaa@test'
        another_user = FactoryBot.build(:user)
        another_user.email = 'aaa@hoge'
        expect(another_user).to be_valid
      end
      it 'emailに@があれば登録できる' do
        @user.email = 'aaa@test'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上なら登録できる' do
        @user.password = 'aaa123aaa'
        @user.password_confirmation = 'aaa123aaa'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数混合なら登録できる' do
        @user.password = 'aaa123aaa'
        @user.password_confirmation = 'aaa123aaa'
        expect(@user).to be_valid
      end
      it 'last_nameが全角(漢字・ひらがな・カタカナ)なら登録できる' do
        @user.last_name = 'あ亜ア'
        expect(@user).to be_valid
      end
      it 'first_nameが全角(漢字・ひらがな・カタカナ)なら登録できる' do
        @user.first_name = 'あ亜ア'
        expect(@user).to be_valid
      end
    end
    context 'エラー発生時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'emailに『@』がないと登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordは5文字以下では登録できない' do
        @user.password = 'abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは文字と数字の両方を含めてください')
      end
      it 'password:半角英数混合(半角数字のみ)' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは文字と数字の両方を含めてください')
      end
      it 'password:全角文字は登録できない' do
        @user.password = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは文字と数字の両方を含めてください')
      end
      it 'passwordは確認用含めて2回入力しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password_confirmation = 'abc123abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は全角で入力してください')
      end
      it 'first_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角で入力してください')
      end
    end
  end
end
