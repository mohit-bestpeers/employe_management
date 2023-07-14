class Leave < ApplicationRecord
  belongs_to :employee
  before_save :calculate_days

  enum :leave_type, {casual: 0, optional: 1, compoff: 2, paid: 3}
  enum :status, {hold: 0, accepted: 1, rejected: 2}

  def accepted_leaves
    leave_days = 0
    if self.status == "accepted"
      if self.to_date.to_date > self.from_date.to_date
        if self.to_session > self.from_session || self.to_session < self.from_session
          leave_days = (self.to_date.to_date - self.from_date.to_date).to_i
        else
          leave_days = ((self.to_date.to_date - self.from_date.to_date).to_i) - 0.5
        end
      elsif self.to_date.to_date == self.from_date.to_date
        if self.to_session > self.from_session || self.to_session < self.from_session
          leave_days = 1
        else
          leave_days = 0.5
        end
      end
    end 
    self.days = leave_days
  end

  private

  def calculate_days
    if self.to_date.to_date > self.from_date.to_date
      if self.to_session > self.from_session || self.to_session < self.from_session
        leave_days = (self.to_date.to_date - self.from_date.to_date).to_i
      else
        leave_days = ((self.to_date.to_date - self.from_date.to_date).to_i) - 0.5
      end
    elsif self.to_date.to_date == self.from_date.to_date
      if self.to_session > self.from_session || self.to_session < self.from_session
        leave_days = 1
      else
        leave_days = 0.5
      end
    end
    self.days = leave_days
  end  
end
