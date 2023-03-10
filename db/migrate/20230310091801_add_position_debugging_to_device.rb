class AddPositionDebuggingToDevice < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :position_debugging, :text
  end
end
