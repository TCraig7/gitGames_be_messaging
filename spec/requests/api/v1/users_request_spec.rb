require 'rails_helper'

describe "Users API" do
  it "can create a new user" do
    user_params = { username: "coder123" }

    post "/api/v1/users", params: {user: user_params}
    user = User.last

    assert_response :success
    expect(response).to be_successful
    expect(user.username).to eq(user_params[:username])
  end

  it "can update a user" do
    user = User.create(username: "coder123", created_at: Time.now - 86400, updated_at: Time.now - 86400 )
    username = user.username

    user_params = { username: "coder123" }
    post "/api/v1/users", params: {user: user_params}

    updated_user = User.find_by(username: username)

    assert_response :success
    expect(response).to be_successful
    expect(updated_user.updated_at).to be > user.updated_at
  end
end
