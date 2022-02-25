class AddCoordinatesToPlanets < ActiveRecord::Migration[6.1]
  def change
    add_column :planets, :latitude, :float
    add_column :planets, :longitude, :float
  end
end
