class Company < ApplicationRecord
	  belongs_to :user
	  has_many :company_comments, dependent: :destroy
	  has_many :favorites, dependent: :destroy

	def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

    def self.search(search)
       if search
       	where(['company_name LIKE? OR industry LIKE? OR company_address LIKE?',"%#{search}%", "%#{search}%", "%#{search}%"])
       else
       	all
       end
    end

  validates :company_name,:company_address, presence: true, length: { maximum: 50 }
  validates :industry,:sale,:operating_income,:disposal_desired_price,:fiscal_year,
            :total_asset,:interest_bearing_debt,:net_asset,:employee_number, presence: true, length: { maximum: 10 }
  validates :transfer_target_asset,:transfer_reason,:business_overview,:customer,
            :product_service,:business_strength,:supplement_information, presence: true, length: { maximum: 100 }

end
