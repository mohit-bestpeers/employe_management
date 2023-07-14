class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :department
  belongs_to :designation
  has_one :detail
  has_and_belongs_to_many :tasks
  has_many :attendances
  has_many :leaves
  has_many :salarys

  def calculate_leave 
    leaves = self.leaves.where(status:"accepted")
    count_leave = 0
    leaves.each do |leave|
      count_leave += leave.days
    end
    count_leave
  end 
end
