class Leave < ApplicationRecord
  belongs_to :employee

  enum :leave_type, {casual: 0, optional: 1, compoff: 2, paid: 4}
  enum :status, {hold: 0, accepted: 1, rejected: 2}
  enum from_session: { session1: 0, session2: 1 }
  enum to_session: { session_one: 0, session_two: 1 }
end
