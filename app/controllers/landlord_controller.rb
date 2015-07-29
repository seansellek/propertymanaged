class LandlordController < ApplicationController
  def new
    @landlord = Landlord.new
  end

  def create
    @landlord = Landlord.new user_params

    # if @landlord.save
    #   redirect_to root_path, notice: "Created Landlord"
    # else
    #   render action: 'new'
    # end
  end

  private
  def user_params
    params.require(:landlord).permit(:username, :password, :password_confirmation)
  end

end
