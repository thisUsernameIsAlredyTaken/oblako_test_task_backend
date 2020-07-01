class Project < ApplicationRecord
  validates :title, :length => { maximum: 40 }, allow_blank: false
  has_many :todos
  default_scope { order("id ASC") }
end
