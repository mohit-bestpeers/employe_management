class Salary < ApplicationRecord
  belongs_to :employee
  before_save :initlialize_salary

  def initlialize_salary
    self.package = employee.package
    self.total_salary = employee.package.to_i / 12
    self.salary_month = Date.today.prev_month.beginning_of_month
    self.salary_amount = self.total_salary.to_i - employee.calculate_leave.to_f * perday_amount 
    self.total_leave = employee.calculate_leave
  end
  
  def perday_amount 
    previous_month = Date.today.prev_month
    days_in_previous_month = Time.days_in_month(previous_month.month, previous_month.year)
    perday_amount = self.total_salary.to_i / days_in_previous_month
  end
end
