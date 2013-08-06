class Event < ActiveRecord::Base

  belongs_to :user
  belongs_to :eventable, polymorphic: true

  validates_presence_of :user_id, :action, :eventable_id, :eventable_type

end
