class OccupancyPicturesController < ApplicationController
before_action :set_property_tenant

def new
  #@property_tenant = PropertyTenant.find(params[:id])
  @occupancy_picture = OccupancyPicture.new
end


private

def occupancy_picture_params
  params.require(:picture).permit(:image, :caption)
end

def set_property_tenant
  @property_tenant = PropertyTenant.find(params[:property_tenant_id])
end

end
