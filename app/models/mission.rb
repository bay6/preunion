class Mission < ActiveRecord::Base

  belongs_to :creator, class_name: "User"
  belongs_to :assigned_to, class_name: "User"

  validates_presence_of :name, :description, :status

  STATUS = {
    0 => "新建",
    1 => "进行中",
    2 => "待验证",
    3 => "完成",
    4 => "关闭"
  }

  def human_status
    STATUS[status||0]
  end

  def available_to_accept?
    status == 0 && assigned_to.nil?
  end

end
