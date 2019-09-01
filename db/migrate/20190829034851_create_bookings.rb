class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :teacher, foreign_key: true
      t.references :student, foreign_key: true
      t.time :booked_at

      t.timestamps
    end
  end
end
