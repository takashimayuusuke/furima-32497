require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'name,email,password,password_confirmation,last_name_chinese_character,first_name_chinese_character,last_name_kana,first_name_kana,birthが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@が存在していないと登録できない' do
      @user.email = 'aaaaaa.test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが6文字以上かつ半角英数字が混合していれば登録できる' do
      @user.password = 'a12345'
      @user.password_confirmation = 'a12345'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下なら登録できない' do
      @user.password = 'a1234'
      @user.password_confirmation = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが数字だけなら登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが半角英字だけなら登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'a12345'
      @user.password_confirmation = '@123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_name_chinese_characterが空では登録できない' do
      @user.last_name_chinese_character = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name chinese character can't be blank")
    end

    it 'first_name_chinese_characterが空では登録できない' do
      @user.first_name_chinese_character = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name chinese character can't be blank")
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'last_name_kanaが漢字では登録できない' do
      @user.last_name_kana = '佑介'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'last_name_kanaがひらがなでは登録できない' do
      @user.last_name_kana = 'ゆうすけ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'last_name_kanaが半角カナでは登録できない' do
      @user.last_name_kana = 'ﾕｳｽｹ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'first_name_kanaが漢字では登録できない' do
      @user.first_name_kana = '高嶋'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'first_name_kanaがひらがなでは登録できない' do
      @user.first_name_kana = 'ゆうすけ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'first_name_kanaが半角カナでは登録できない' do
      @user.first_name_kana = 'ﾀｶｼﾏ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it 'birthが空では登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
