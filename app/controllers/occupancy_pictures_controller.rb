class OccupancyPicturesController < ApplicationController
before_action :set_property_tenant
before_action :set_occupancy_picture, only: [:create, :destroy, :update, :edit]


def new
  @occupancy_picture = OccupancyPicture.new
end

def create

   @occupancy_picture = @property_tenant.occupancy_pictures.new(occupancy_picture_params)


  if @occupancy_picture.save
    flash[:notice] = "The image was successfuly saved"
    redirect_to property_path(@property_tenant)
  else
    render :back
  end

end

def edit
end


def update
    @occupancy_picture.update_attributes(occupancy_picture_params)
    redirect_to property_path(@property_tenant)
end

def destroy
    @occupancy_picture.destroy
    redirect_to property_path(@property_tenant)
end


private

def occupancy_picture_params
  params.require(:occupancy_picture).permit(:image, :caption)
end

def set_property_tenant
  @property_tenant = PropertyTenant.find(params[:property_tenant_id])
end

def set_occupancy_picture
  @occupancy_picture = OccupancyPicture.find(params[:id])
end

end
