require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "正常に登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'ニックネームがないと登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'メールアドレスがないと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性でないといけない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含まなければいけない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードがなければ登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力でないといけない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角数字のみでは登録できない' do
        @user.password = "111111" 
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードは、半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.save
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードは、半角英数字混合でなければ登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.save
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードとパスワード（確認）は、値の一致しなければいけない' do
        @user.password = '123w456'
        @user.password_confirmation = '1234567'
        @user.save
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)は、名字がないと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(全角)は、名前がないと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '姓(全角)に、半角文字が含まれていると登録できない' do
        @user.last_name = 'Tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it '名(全角)に、半角文字が含まれていると登録できない' do
        @user.last_name = 'Tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'お名前カナ(全角)は、名字がないと登録できない' do
        @user.read_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read last is invalid")
      end
      it 'お名前カナ(全角)は、名前がないと登録できない' do
        @user.read_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first is invalid")
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name = 'Tanaka'
        @user.last_name = 'たなか'
        @user.last_name = '田中'
        @user.last_name = '。；；：'
        @user.last_name = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name = 'Tarou'
        @user.last_name = '12345'
        @user.last_name = 'たろう'
        @user.last_name = '太郎'
        @user.last_name = '：；・。、'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it '生年月日がないと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
