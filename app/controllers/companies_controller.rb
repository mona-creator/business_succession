class CompaniesController < ApplicationController
        before_action :authenticate_user!, only: [:new, :ranks]
	def new
    @company = Company.new
	end

	def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    if @company.save
      redirect_to company_path(@company.id)
    else
      render "new"
    end
	end

	def index
    @companies = Company.search(params[:search])
	end

  def ranks
    @all_ranks = Company.find(Favorite.group(:company_id).order('count(company_id)desc').limit(3).pluck(:company_id))
  end

	def show
    @company = Company.find(params[:id])
    @user = current_user
    @company_comment = CompanyComment.new
	end

	def edit
    @company = Company.find(params[:id])
    if @company.user == current_user
       render "edit"
    else
       redirect_to companies_path
    end
	end

	def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
       redirect_to company_path, notice: "successfully updated company!"
	  else
      render "edit"
    end
  end

	def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to user_path(current_user)
	end

private
    def company_params
     params.require(:company).permit(
      :user_id,
      :image_id,
      :company_name,
      :industry,
      :sale,
      :operating_income,
      :disposal_desired_price,
      :company_address,
      :fiscal_year,
      :total_asset,
      :interest_bearing_debt,
      :net_asset,
      :employee_number,
      :transfer_target_asset,
      :transfer_reason,
      :business_overview,
      :customer,
      :product_service,
      :business_strength,
      :supplement_information,
     )
    end
end

