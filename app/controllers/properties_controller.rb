class PropertiesController < ApplicationController
  before_action :require_logged_in
  def new
  	@property = Property.new
  end

  def show
  	@property = Property.find(params[:id])
  end

  def create
    #make sure we assign the property with the attributes the user entered.
    @property = current_user.properties.new(property_params)

    if @property.save
      flash[:notice] = "The Property is successfully saved!"
      redirect_to dashboard_path
    else
      render :back
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Landlord.find params[:id]

    if @property.update_attributes
      flash[:notice] = 'The Property is successfully updated!'
      redirect_to edit_property_path
    else
      flash[:error] = @property.errors.full_messages[0]
      redirect_to edit_property_path
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  #use strong parameters to protect from mass assignment
  def property_params
    params.require(:property).
      permit(:name, :address1, :address2, :city, :state, :zip)
  end

end

