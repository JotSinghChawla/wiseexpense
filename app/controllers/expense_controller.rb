class ExpenseController < ApplicationController
    before_action :authenticate_wiseuser!, except: %i[get_subcategories]

    def new
        @new_expense = Expense.new
    end

    def create
        temp_expense_params = expense_params
        temp_expense_params["expense_time"] = Time.parse(temp_expense_params["expense_time"]).utc
        
        @new_expense = Expense.new(temp_expense_params)
        if @new_expense.save
            redirect_to root_path, notice: "Expense Added Successfuly!"
        else
            flash.now[:alert] = "Error: #{@new_expense.errors.full_messages}"
            render :new, status: :unprocessable_entity
        end
    end

    def get_subcategories
        respond_to do |format|
            format.json { render json: Expense.get_expense_sub_categories_for(params['main_category'].to_s).keys.map {|item| [item.humanize, item]} }
        end
    end

    private

    def expense_params
        params.require(:expense).permit(:wiseuser_id, :amount, :main_category, :sub_category, :description, :payment_mode, :expense_time)
    end
end
