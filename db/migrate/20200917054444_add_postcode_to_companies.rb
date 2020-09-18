class AddPostcodeToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :postcode, :integer
    add_column :companies, :prefecture_code, :integer
    add_column :companies, :address_city, :string
    add_column :companies, :address_street, :string
    add_column :companies, :address_building, :string
  end
end
