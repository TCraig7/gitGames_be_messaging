require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
  end

  it 'can create a user' do
    user1 = User.create!(username: "coder123", created_at: Time.now, updated_at: Time.now)
    user2 = User.create!(username: "drdoom12", created_at: Time.now, updated_at: Time.now)

    user = User.last

    expect(user.username).to eq("drdoom12")
  end
end
