class PropertiesController < ApplicationController
  def new
  	@property = Property.new
  end

  def show
  	@property = Property.find(params[:id]) 
  end

  def create
    @property = current_user.properties.new

    if @property.save 
      flash[:notice] = "The Property is successfully saved!"
      redirect_to dashboard_path
    else
      render :back
    end

  end

end
