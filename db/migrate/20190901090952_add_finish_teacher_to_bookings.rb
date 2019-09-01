class AddFinishTeacherToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :finish_teacher, :boolean, default: false, null: false
  end
end
