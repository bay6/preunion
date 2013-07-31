class ChangeStatusOfMissionsToInteger < ActiveRecord::Migration
  def change
    change_column :missions, :status, :integer
  end
end
