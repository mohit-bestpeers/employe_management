class AttendanceSerializer < ActiveModel::Serializer
  attributes :attendance
  def attendance
    {
      to: object.to,
      date: object.date,
      in_time: object.in_time,
      out_time: object.out_time,
      status: object.status,
      task: object.task
    }
  end
end
