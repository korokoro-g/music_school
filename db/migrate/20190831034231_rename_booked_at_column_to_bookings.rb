class RenameBookedAtColumnToBookings < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :booked_at, :booked_at_time
  end
end
