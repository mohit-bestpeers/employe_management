class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :email, :name

  belongs_to :department, serializer: DepartmentSerializer
end
