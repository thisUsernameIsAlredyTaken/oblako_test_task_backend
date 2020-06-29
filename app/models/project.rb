class Project < ApplicationRecord
  has_many :todos, -> { order("id ASC") }
end

