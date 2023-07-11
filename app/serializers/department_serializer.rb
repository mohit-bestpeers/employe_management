class DepartmentSerializer < ActiveModel::Serializer
  attributes  :name

  has_many :employees, serializer: EmployeeSerializer
end
