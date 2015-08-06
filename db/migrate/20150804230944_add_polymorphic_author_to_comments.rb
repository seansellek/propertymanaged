class AddPolymorphicAuthorToComments < ActiveRecord::Migration
  def change
      add_reference :comments, :author, polymorphic: true, index:true
  end
end
