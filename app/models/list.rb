class List < ApplicationRecord
  validates_presence_of :name, :due_date, :note

  def can_destroy?
    !overdue?
  end

  private

  def overdue?
    due_date < Date.today
  end
end
