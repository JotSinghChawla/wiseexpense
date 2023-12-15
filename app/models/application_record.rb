class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  before_validation :set_defaults, on: :create

  private

  def set_defaults
  end
end
