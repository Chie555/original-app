require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'ニックネームとEメールとパスワードと体重・身長・目標体重が存在すれば登録できる' do
        @user.sex_id = '0'
        @user.birthday = ''
        @user.prefecture_id = '0'
        @user.fat_percentage = ''
        @user.target_bmi = ''
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has exist')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaa00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'Ａ00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'bbb000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '体重が空では登録できない' do
        @user.weight = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Weight can't be blank")
      end
      it '身長が空では登録できない' do
        @user.height = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Height can't be blank")
      end
      it '目標体重が空では登録できない' do
        @user.target_height = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("TargetWeight can't be blank")
      end
    end
  end

end
