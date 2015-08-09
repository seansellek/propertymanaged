class CommentsController < ApplicationController
  before_action :require_logged_in
  before_action :get_ticket, only: [:new]
  
  def index
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = current_user.comments.new
    @comment.commentable = @ticket
  end

  def create
    @comment = current_user.comments.new(comment_params)
    #@comment = current_user.current_occupancy.tickets.comment.new(comment_params)
    if @comment.save
      #TODO: create notification
      flash[:notice] = "The Ticket is successfully saved!"
      redirect_to ticket_path(@comment.commentable_id)
    else
      render :back
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params['id'])
    @ticket = @comment.commentable
    @comment.update_attributes(comment_params)
    redirect_to ticket_path(@ticket)
  end


  def destroy
    @comment = Comment.find(params['id'])
    @ticket = @comment.commentable
    @comment.destroy
    redirect_to ticket_path(@ticket)
  end

  private
  #use strong parameters to protect from mass assignment
  def comment_params
    params.require(:comment).
      permit(:author, :body, :commentable_id, :commentable_type)
  end

  def get_ticket
        @ticket = Ticket.find(params[:ticket_id])
      # elsif params[:document_id]
      #   parent = landlord.find(params[:document_id])
  end

end
