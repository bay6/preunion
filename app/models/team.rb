class Team < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true

  def has_joined? user
    users.include?(user)
  end
end
