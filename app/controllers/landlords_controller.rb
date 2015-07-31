class LandlordsController < ApplicationController
  def new
    @landlord = Landlord.new
  end

  def create
    @landlord = Landlord.new user_params

    if @landlord.save
      flash[:notice] = "The Landlord is successfully saved!"
      redirect_to signup_path #, notice: "Created Landlord"
    end
  end

  private
  def user_params
    params.require(:landlord).permit(:name, :password, :password_confirmation, :email)
  end

end
