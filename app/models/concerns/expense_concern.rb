module ExpenseConcern
    extend ActiveSupport::Concern

    class_methods do 
        def get_expense_sub_categories_for(main_category='anonymous')
            filter_arr=[1]
            if main_category == 'transportation'
                filter_arr = [1,2,3,4] 
            elsif main_category == 'food_and_groceries'
                filter_arr = [1,5,6,7]
            elsif main_category == 'personal_items'
                filter_arr = [1,8,9,10] 
            elsif main_category == 'health'
                filter_arr = [1,11,12,13] 
            elsif main_category == 'loan_and_debt'
                filter_arr = [1,14,15,16] 
            elsif main_category == 'entertainment'
                filter_arr = [1,17,18,19] 
            elsif main_category == 'bills'
                filter_arr = [1,20,21,22] 
            elsif main_category == 'savings'
                filter_arr = [1,23,24,25] 
            elsif main_category == 'anonymous'
                filter_arr = [1] 
            end
            Expense.sub_categories.filter{|k,v| filter_arr.include?(v)}
        end
    end
end
