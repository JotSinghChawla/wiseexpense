class HomeController < ApplicationController
  def index
    @all_expense = @current_wiseuser.try(:expenses)
  end
end
