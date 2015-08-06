require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:ticket) { create :ticket }
  let(:comment) { create :comment}
  subject { comment }

  it "has comment properties" do
    subject.should respond_to(:author)
    subject.should respond_to(:body)
  end

  it { should belong_to :commentable }

  it { should belong_to :author } 

  it { should validate_presence_of(:body) }


end