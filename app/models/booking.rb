class Booking < ApplicationRecord
  validates :booked_at_date, presence: true
  validates :booked_at_time, presence: true
  
  belongs_to :teacher
  belongs_to :student
end
