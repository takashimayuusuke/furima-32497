require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "name,email,password,password_confirmation,last_name_chinese_character,first_name_chinese_character,last_name_kana,first_name_kana,birthが存在すれば登録できる" do
      
    end

    it "nameが空では登録できない" do
      
    end

    it "emailが空では登録できない" do
      
    end

    it "passwordが6文字以上かつ半角英数字が混合していれば登録できる" do
      
    end

    it "passwordが5文字以下なら登録できない" do
      
    end

    it "passwordが数字だけなら登録できない" do
      
    end

    it "passwordが半角英字だけなら登録できない" do
      
    end

    it "passwordとpassword_confirmationが不一致では登録できない" do
      
    end

    it "last_name_chinese_characterが空では登録できない" do
      
    end

    it "first_name_chinese_characterが空では登録できない" do
      
    end

    it "last_name_kanaが空では登録できない" do
      
    end

    it "first_name_kanaが空では登録できない" do
      
    end

    it "birthが空では登録できない" do
      
    end
  end
end
