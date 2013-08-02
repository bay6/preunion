module ApplicationHelper
end

class String

  def shorter(size)
    if self.length > size
      self[0..(size-1)] + "..."
    else
      self
    end
  end
end
