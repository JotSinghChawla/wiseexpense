module HomeHelper
    def last_30_days_spending
        @all_expense.where("expense_time >= ?",Time.zone.now - 1.month).group_by_day(:expense_time).sum(:amount)
    end

    def last_7_days_spending
        @all_expense.where("expense_time >= ?",Time.zone.now - 7.days).group_by_day(:expense_time).sum(:amount)
    end

    def total_category_wise_spending
        @all_expense.group(:main_category).sum(:amount).map{|k,v| [k.humanize, v]}
    end
end