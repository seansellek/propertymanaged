require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:comment) { create :comment }
  let(:ticket) { create :ticket }
  let(:propertytenant) { ticket.property_tenant }
  let(:tenant) { propertytenant.tenant}

  
  context 'GET #new' do
    it 'Instantiates a new comment' do
      login tenant
      get 'new'
      expect(assigns[:comment]).to be_a(Comment)
    end


    it "Renders 'new' view" do
      login tenant
      get 'new'
      expect(response).to render_template(:new)
    end
  end


   context 'POST #create' do

    # it 'Assigns @comment to ticket' do
    #   login tenant
    #   post 'create', comment: attributes_for(:comment), ticket_id: ticket.id
    #   expect(assigns(:comment).commentable).to eq(ticket)
    # end
    it 'Assigns current_user to @comment.author' do
      login tenant
      post 'create', comment: attributes_for(:comment), ticket_id: ticket.id
      expect(assigns(:comment).author).to eq(tenant) 
    end

    # it 'Saves comment to database' do
    #   login tenant
    #   post 'create', comment: attributes_for(:comment), ticket_id: ticket.id
    #   expect(assigns(:comment).persisted?).to be_truthy
    # end
  end


  context 'GET #edit' do
      
    it "renders 'edit' view" do
      login tenant
      get :edit, id: comment.id
      expect(response).to render_template :edit
    end

    
    # it 'only allows owner of comment to edit' do
    #   login tenant
    #   comment2 = create :comment
    #   get 'edit', id: comment2.id
    #   expect(flash[:error]).to_not be_nil
    #   #expect(response).to redirect_to ticket_path(@ticket)
    # end
  end


  context 'PUT #update' do
  
    it 'retrieves comment from db and instantiates it as @comment' do
      login tenant
      get :edit, id: comment.id
      expect(assigns(:comment)).to eq(comment)
    end 

     it 'redirects to ticket' do
      login tenant
      comment.commentable = ticket
      comment.save
      put 'update', id: comment.id, comment: attributes_for(:comment, body: 'some text')
      expect(response).to redirect_to ticket_path(ticket.id)
    end
  end


  context  "DELETE destroy " do

    it "deletes the comment and redirects to comments#index" do 
      login tenant
      comment.commentable = ticket
      comment.save
      expect{ delete :destroy, id: comment }.to change(Comment,:count).by(-1) 
      expect(response).to redirect_to ticket_path(ticket.id)

    end 

end






end
