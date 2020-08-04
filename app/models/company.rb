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
end
