class SalarySerializer < ActiveModel::Serializer
  attributes :salary

  def salary
    {
      package: object.package.to_i,
      salary_month: object.salary_month.to_date,
      total_salary: object.total_salary.to_i,
      salary_amount: object.salary_amount.to_i,
      total_leave: object.total_leave,
    }
  end
end
