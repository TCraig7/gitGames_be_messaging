require 'rails_helper'

describe "Users API" do
  it "can create a new user" do
    user_params = { username: "coder123", created_at: Time.now, updated_at: Time.now }

    post "api/v1/emails", params: {user: user_params}
    user = User.last

    assert_response :success
    expect(response).to be_successful
    expect(user.username).to eq(user_params[:username])
  end
end
