class PicturesController < ApplicationController

before_action :set_picture, only: [:show, :edit, :update, :destroy]
before_action :set_ticket, only: [:create, :update, :destroy]

def index
end

def edit

end

def new
  @picture = Picture.new
end

def create

  @picture = @ticket.pictures.new(picture_params)
    
  
  if @picture.save
    flash[:notice] = "The image was successfuly saved"
    redirect_to ticket_path(@ticket)
  else
    render :back
  end

end

def update
    # @ticket = Ticket.find(params[:ticket_id])
    @picture.update_attributes(picture_params)
    redirect_to ticket_path(@ticket)
end

def destroy
    @picture.destroy
    redirect_to ticket_path(@ticket)
end

private

def picture_params
  params.require(:picture).permit(:image, :caption)
end

def set_ticket
  @ticket = Ticket.find(params[:ticket_id])
end

def set_picture
  @picture = Picture.find(params[:id])
end

end
