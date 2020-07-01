class Todo < ApplicationRecord
  validates :text, :length => {maximum: 140}, allow_blank: false
  belongs_to :project, :optional => true
  default_scope { order("id ASC") }
end
