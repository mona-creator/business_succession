class CompanyCommentsController < ApplicationController
        before_action :authenticate_user!
	def create
     	company = Company.find(params[:company_id])
        comment = current_user.company_comments.new(company_comment_params)
		comment.company_id = company.id
	    comment.save
	    redirect_to company_path(company)
	end

	def destroy
    @company_comment = CompanyComment.find(params[:company_id])
    if @company_comment.user != current_user
      redirect_to request.referer
    end
    @company_comment.destroy
    redirect_to request.referer

    end

	private

    def company_comment_params
    params.require(:company_comment).permit(:comment)
    end
end
