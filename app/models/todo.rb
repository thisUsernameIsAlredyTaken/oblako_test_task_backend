class Todo < ApplicationRecord
  belongs_to :category

  def isCompleted
    is_completed
  end
end

