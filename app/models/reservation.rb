class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  has_one :user_as_owner, through: :vehicles, source: :user
  validates :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w[pending accepted declined cancelled] }
  validate :end_date_is_after_start_date

  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if start_date < Date.today
      errors.add(:start_date, "cannot be before today")
    elsif end_date < start_date
      errors.add(:end_date, "cannot be before the start date")
    else
      return
    end
  end
end
