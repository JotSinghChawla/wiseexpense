class HomeController < ApplicationController
  before_action :set_all_expense

  def index
  end

  private

  def set_all_expense
    @all_expense = @current_wiseuser.try(:expenses)
  end
  
end
