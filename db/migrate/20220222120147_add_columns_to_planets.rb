class AddColumnsToPlanets < ActiveRecord::Migration[6.1]
  def change
    add_column :planets, :name, :string
    add_column :planets, :location, :string
    add_reference :planets, :user, null: false, foreign_key: true
  end
end
