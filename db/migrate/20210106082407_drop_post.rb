class DropPost < ActiveRecord::Migration[5.2]
  def change
    drop_table :relation_ships
  end
end
