class CreateCompanyComments < ActiveRecord::Migration[5.2]
  def change
    create_table :company_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
