class LandlordsController < ApplicationController
  def new
    @landlord = Landlord.new
  end

  def create
    @landlord = Landlord.new user_params

    if @landlord.save
      redirect_to :back #, notice: "Created Landlord"
    else
      render action: 'new'
    end
  end

  private
  def user_params
    params.require(:landlord).permit(:name, :password, :password_confirmation, :email)
  end

end
