class TaskSerializer < ActiveModel::Serializer
  attributes :task
  def task
    {
      title: object.title,
      description: object.description,
      start_date: object.start_date,
      due_date: object.due_date,
      status: object.status
    }
  end
end
