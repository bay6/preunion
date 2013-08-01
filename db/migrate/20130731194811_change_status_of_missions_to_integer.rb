class ChangeStatusOfMissionsToInteger < ActiveRecord::Migration
  def up
    if Rails.env.production?
    connection.execute(%q{
        alter table tweets
        alter column number
        type integer using cast(number as integer)
    })
    else
      change_column :missions, :status, :integer
    end
  end

  def down
    change_column :missions, :status, :string
  end
end
