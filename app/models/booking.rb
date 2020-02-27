class Booking < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  CATEGORIES = %w(Grandpa Teenager Child Family University Father Mother Brother Sister)

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def formatted_start_date
    start_date.strftime('%Y %b %e %l:%M %p')
  end

  def formatted_end_date
    start_date.strftime('%Y %b %e %l:%M %p')
  end

end

