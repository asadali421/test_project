require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation tests" do
    let(:user) { build(:user, email: '') }
    let(:user1) { build(:user, name: '') }
    it 'ensures email presence' do
      # user = User.new(name:'name', password:'password', user_type: "user_type").save
      expect(user.save).to eq(false)
    end

    it 'ensures name presence' do
      expect(user1.save).to eq(false)
    end

    # it 'ensures user_type presence' do
    #   # user = User.new(name:'name', password:'password', email: "email@email.com").save
    #   expect(user).to eq(false)
    # end

    # it 'ensures email presence' do
    #   # user = User.new(name:'name',email: 'email@email.com', password:'password', user_type: "user_type").save
    #   expect(user).to eq(true)
    # end
  end
end
