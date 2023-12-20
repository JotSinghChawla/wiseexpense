require 'rails_helper'

RSpec.describe "Wiseusers", type: :request do
  it "creates a new wiseuser with valid data" do
    post "/wiseuser/create", params: {
      wiseuser: {
        first_name: "ABC",
        last_name: "Demo",
        password: "123",
        email: "abcdemo@gmail.com"
      }
    }
    expect(response).to redirect_to(root_path)
    expect(response).to have_http_status(:redirect)
  end

  it "render new user template" do
    get "/wiseuser/new"
      expect(response).to render_template(:new)
  end
end
