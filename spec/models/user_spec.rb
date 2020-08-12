require 'rails_helper'

RSpec.describe User, type: :model do
  context "データが正しく保存される" do
    before do
      @user = User.new
      @user.email = ""
      @user.surname = "山田"
      @user.first_name = "太郎"
      @user.surname_kana = "ヤマダ"
      @user.first_name_kana = "タロウ"
      @user.postal_code = "7654321"
      @user.address = "東京都千代田区1-1-1"
      @user.phone_number = "08012345678"
      @user.save
    end
    it "全て入力してあるので保存される" do
      expect(@user).to be_valid
    end
  end
  # ここから追加
  context "データが正しく保存されない" do
    before do
      @user = User.new
      @user.email = ""
      @user.surname = ""
      @user.first_name = "太郎"
      @user.surname_kana = "ヤマダ"
      @user.first_name_kana = "タロウ"
      @user.postal_code = "7654321"
      @user.address = "東京都千代田区1-1-1"
      @user.phone_number = "08012345678"
      @user.save
    end
    it "surnameが入力されていないので保存されない" do
      expect(@user).to be_invalid
      expect(@user.errors[:surname]).to include("can't be blank")
    end
  end  # ここまで追加
end
#    describe 'バリデーションのテスト' do
#     let(:user) { build(:user) }
#     subject { test_user.valid? }
#     context 'surnameカラム' do
#       let(:test_user) { user }
#       it '空欄でないこと' do
#         test_user.surname = ''
#         is_expected.to eq false;
#       end
#       it '1文字以上であること' do
#         test_user.surname = Faker::Lorem.characters(number:0)
#         is_expected.to eq false;
#       end
#       it '10文字以下であること' do
#         test_user.surname = Faker::Lorem.characters(number:11)
#         is_expected.to eq false;
#       end
#     end

#     context 'addressカラム' do
#       let(:test_user) { user }
#       it '20文字以下であること' do
#         test_user.address = Faker::Lorem.characters(number:21)
#         is_expected.to eq false
#       end
#     end
#   end
#   describe 'アソシエーションのテスト' do
#     context 'Companyモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(User.reflect_on_association(:books).macro).to eq :has_many
#       end
#     end
#   end
# end
