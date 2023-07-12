class AttendanceSerializer < ActiveModel::Serializer
  attributes :attendance
  def attendance
    {
      to: object.to,
      date: object.date,
      in_time: object.in_time.strftime('%H:%M:%S'),
      out_time: object.out_time.strftime('%H:%M:%S'),
      status: object.status,
      task: object.task
    }
  end
end
