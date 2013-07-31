class Mission < ActiveRecord::Base

  belongs_to :creator, class_name: "User", foreign_key: "creator"
  belongs_to :assigned_to, class_name: "User", foreign_key: "assigned_to"

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

end
