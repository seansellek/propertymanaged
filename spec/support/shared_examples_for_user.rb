shared_examples_for 'a user' do
   context "has correct attributes" do
    it { should respond_to :name }
    it { should respond_to :email }
    it { should have_secure_password }
  end

  context "is invalid" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }
    it { should_not allow_value("adlkj").for(:email) }
    it { should allow_value("ptico@ptico.net").for(:email) }
    it { should validate_length_of(:password).is_at_least(8).with_message(/.*too short.*/i) }
  end
end
