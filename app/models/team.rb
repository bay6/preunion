class Team < ActiveRecord::Base
  has_and_belongs_to_many :users

  def has_joined? user
    users.include?(user)
  end
end
