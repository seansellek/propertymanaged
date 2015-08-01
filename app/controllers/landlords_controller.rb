class LandlordsController < ApplicationController
  def new
    @landlord = Landlord.new
  end

  def create
    @landlord = Landlord.new user_params

    if @landlord.save
      flash[:notice] = "The Landlord is successfully saved!"
      redirect_to login_path #, notice: "Created Landlord"
    else
      flash[:error] = @landlord.errors.full_messages[0]
      redirect_to signup_path
    end
  end

  def edit
    @landlord = Landlord.find params[:id]
  end

  def update
    @landlord = Landlord.find params[:id]

    if @landlord.update_attributes user_params
      flash[:notice] = 'The Landlord is successfully updated!'
      redirect_to edit_landlord_path
    else
      flash[:error] = @landlord.errors.full_messages[0]
      redirect_to edit_landlord_path
    end
  end
  private
  def user_params
    params.require(:landlord).permit(:name, :password, :password_confirmation, :email)
  end

end
