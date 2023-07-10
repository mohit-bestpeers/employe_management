class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :email, :name

  belongs_to :department, serializer: DepartmentSerializer
  belongs_to :detail, serializer: DetailSerializer
end
