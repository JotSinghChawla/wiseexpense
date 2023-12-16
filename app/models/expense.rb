class Expense < ApplicationRecord

  include ExpenseConcern

  belongs_to :wiseuser

  validates :amount, :wiseuser_id, :main_category, :sub_category, :payment_mode, :description, :expense_time, presence: true

  validates :expense_time, comparison: {less_than_or_equal_to: Time.zone.now + 10.minutes, message: "can't be added for future!"}

  META_FIELDS = [].freeze

  META_FIELDS.each do |item|
    define_method?("#{item}?") do 
      self.meta[item.to_s].present? 
    end

    define_method?("#{item}") do 
      self.meta[item.to_s]
    end

    define_method?("#{item}=") do |value=nil| 
      self.meta[item.to_s] = value
    end
  end

  enum main_category: {
    transportation: 1,
    food_and_groceries: 2,
    personal_items: 3,
    health: 4,
    loan_and_debt: 5,
    entertainment: 6,
    bills: 7,
    savings: 8,
    anonymous: 9
  }

  enum sub_category: {
    others: 1,
  
    # Transportation
    fuel: 2,
    public_transportation: 3,
    travel_repairs: 4,
  
    # Food and Groceries
    groceries: 5,
    dining_out: 6,
    snacks: 7,
  
    # Personal Items
    clothes: 8,
    haircuts: 9,
    accessories: 10,
  
    # Health
    insurance: 11,
    medication: 12,
    doctor_visits: 13,
  
    # Loan & Debt
    credit_card_payments: 14,
    loans: 15,
    borrowing: 16,
  
    # Entertainment
    ott: 17,
    movies_theater: 18,
    hobbies: 19,
  
    # Bills
    rent: 20,
    utilities: 21,
    maintenance: 22,
  
    # Savings
    emergency_fund: 23,
    investments: 24,
    goal_saving: 25
  }  

  enum payment_mode: {
    cash: 1,
    upi: 2,
    card_payment: 3,
    online_banking: 4,
    unknown: 5
  }
  
  private

  def set_defaults
    self.meta ||= {}
  end

end
