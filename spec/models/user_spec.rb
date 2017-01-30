require 'rails_helper'
describe User do
  describe '#create' do

    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = build(:user, name: "")
      user.valid?
            # binding.pry
      expect(user.errors[:name]).to include("が入力されていません。")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "is invalid without a passsword" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "is invalid without a passsword_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("が内容とあっていません。")
    end

    it "is invalid name is 7 or more characters" do
      user = build(:user, name: "hogehog")
      user.valid?
      expect(user.errors[:name]).to include("は6文字以下に設定して下さい。")
    end

    it "is valid name is 6 or fewer characters" do
      user = build(:user, name: "hogeho")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      user_1 = build(:user, email: "b@b")
      user_2 = build(:user, email: "b@b")
      user_2.valid?
      expect(user_2.errors[:email]).to include("は既に使用されています。")
    end

    it "is valid 8 characters or more, you can register" do
      user = build(:user, password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid 7 characters or less" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      binding.pry
      user.valid?
      expect(user.errors[:password]).to include("は8文字以上に設定して下さい。")
    end

  end
end
