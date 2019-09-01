class AddBookedAtDateToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :booked_at_date, :date
  end
end
