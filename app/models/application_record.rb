class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  before_validation :set_defaults, on: :create
end
