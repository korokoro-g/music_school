class AddFinishStudentToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :finish_student, :boolean, default: false, null: false
  end
end
