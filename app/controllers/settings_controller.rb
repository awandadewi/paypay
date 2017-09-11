class SettingsController < ApplicationController
  before_action :authenticate_user!

  # Apply for koinworks
  def new
  end

  # Call api koinworks
  def create
    attributes = {
      company_name: params[:company_name],
      pic_name: params[:pic_name],
      position: params[:position],
      phone_number: params[:phone_number],
      id: current_user.company.id
    }
    if KoinWrapper.register_company(attributes)
      current_user.company.update_attributes(kw_integrated: true)
      redirect_to new_setting_path
    else
      render :new
    end
  end

end
