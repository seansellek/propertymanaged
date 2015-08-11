class PicturesController < ApplicationController

# before_action :set_picture, only: [:show, :edit, :update, :destroy]
# before_action :set_ticket, only: [:create, :update, :destroy]

def new
  @picture = Picture.new
end

def create
  @picture = Picture.new(picture_params)
  if @picture.save
    render json: { message: "success", picture_id: @picture.id}, status: 200
  else
    render json: { error: @picture.errors.full_messages.join(',')}, status: 400
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
  params.require(:picture).permit(:image)
end

# def set_ticket
#   @ticket = Ticket.find(params[:ticket_id])
# end

# def set_picture
#   @picture = Picture.find(params[:id])
# end

end
