class AddAddressToPlanets < ActiveRecord::Migration[6.1]
  def change
    add_column :planets, :address, :string
  end
end
