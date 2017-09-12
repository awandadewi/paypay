class LoansController < ApplicationController
  before_action :authenticate_user!

  # Apply loan
  def new
  end

  # Call api koinworks
  def create
    raise if params[:amount].blank?

    attributes = {
      email: current_user.email,
      amount: params[:amount],
      duration: params[:duration],
      company_id: current_user.company.id
    }

    raise unless KoinWrapper.apply_loan(attributes)

    redirect_to new_loan_path, notice: "Your loan already submitted, please wait untill KoinWorks approved."
  rescue
    redirect_to new_loan_path, alert: "Something went wrong, please try again."
  end

end
