class ExpenseController < ApplicationController
    before_action :authenticate_wiseuser!

    def new
        @new_expense = Expense.new
    end

    def create
        @new_expense = Expense.new(expense_params)
        if @new_expense.save
            redirect_to root_path, notice: "Expense Added Successfuly!"
        else
            flash.now[:alert] = "Error: #{@new_expense.errors.full_messages}"
            render :new, status: :unprocessable_entity
        end
    end

    private

    def expense_params
        params.require(:expense).permit(:wiseuser_id, :amount, :main_category, :sub_category, :expense_time, :description, :payment_mode)
    end
end
