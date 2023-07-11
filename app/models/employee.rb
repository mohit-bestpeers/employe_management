class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :department
  belongs_to :designation
  has_one :detail
  has_and_belongs_to_many :tasks
end
