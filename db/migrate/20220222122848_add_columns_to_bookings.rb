class AddColumnsToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
  end
end
