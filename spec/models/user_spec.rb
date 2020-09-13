require 'rails_helper'

RSpec.describe User, type: :model do
  it "姓、名、カナ、メール、住所、郵便番号、電話番号、パスワードがある場合、有効である" do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it "姓がない場合、無効である" do
    user = FactoryBot.build(:user, surname: nil)
    user.valid?
    expect(user.errors[:surname]).to include("can't be blank")
  end

  it "名がない場合、無効である" do
    user = FactoryBot.build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "姓(カナ)がない場合、無効である" do
    user = FactoryBot.build(:user, surname_kana: nil)
    user.valid?
    expect(user.errors[:surname_kana]).to include("can't be blank")
  end

  it "名(カナ)がない場合、無効である" do
    user = FactoryBot.build(:user, first_name_kana: nil)
    user.valid?
    expect(user.errors[:first_name_kana]).to include("can't be blank")
  end


  it "メールアドレスがない場合、無効である"  do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end


  it "郵便番号がない場合は、無効である" do
    user = FactoryBot.build(:user, postal_code: nil)
    user.valid?
    expect(user.errors[:postal_code]).to include("can't be blank")
  end

  it "住所がない場合は、無効である" do
    user = FactoryBot.build(:user, address: nil)
    user.valid?
    expect(user.errors[:address]).to include("can't be blank")
  end

  it "電話番号がない場合、無効である" do
    user = FactoryBot.build(:user, phone_number: nil)
    user.valid?
    expect(user.errors[:phone_number]).to include("can't be blank")
  end
end