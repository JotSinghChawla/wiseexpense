require 'rails_helper'

RSpec.describe "Expense controller", type: :request do
  it "creates a new expense with valid data" do
    post "/expense", params: {
      expense: {
        wiseuser_id: 1,
        amount: 2000,
        main_category: 1,
        sub_category: 1,
        description: "Random Description for testing",
        payment_mode: 1,
        expense_time: Time.zone.now
      }
    }
    expect(response).to redirect_to(wiseuser_new_path)
    expect(response).to have_http_status(:redirect)
  end

  it "render new expense template" do
    get "/expense/new"
      expect(response).to render_template(:new)
  end
end
