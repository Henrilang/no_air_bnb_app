class RemoveColumnFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :date, :date
  end
end
