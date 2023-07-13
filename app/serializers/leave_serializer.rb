class LeaveSerializer < ActiveModel::Serializer
  attributes :leave
  def leave
    {
      leave_type: object.leave_type,
      from_date: object.from_date.to_date,
      to_date: object.to_date.to_date,
      days: object.days,
      mail_to: object.mail_to,
      reason: object.reason,
      from_session: object.from_session,
      to_session: object.to_session,
      status: object.status
    }
  end
end
