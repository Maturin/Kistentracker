class CratePriority < ActiveRecord::Base
  validates :priority, :description, :presence => true
  validates :priority, :description, :uniqueness => true
end
