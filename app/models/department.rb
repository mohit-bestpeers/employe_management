class Department < ApplicationRecord
  has_many :employees 
  has_many :designations, through: :employees

  before_create :first_method
  before_save :second_method
end

