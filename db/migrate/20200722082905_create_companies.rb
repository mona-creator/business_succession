class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.string :image_id
      t.string :industry
      t.integer :sale
      t.integer :operating_income
      t.integer :disposal_desired_price
      t.text :company_address
      t.integer :fiscal_year
      t.integer :total_asset
      t.integer :interest_bearing_debt
      t.integer :net_asset
      t.integer :employee_number
      t.text :transfer_target_asset
      t.text :transfer_reason
      t.text :business_overview
      t.text :customer
      t.text :product_service
      t.text :business_strength
      t.text :supplement_information

      t.timestamps
    end
  end
end
