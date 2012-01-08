class CratePriority < ActiveRecord::Base
  has_many :crate, :foreign_key => :crate_priority_value, :primary_key => :priority
  validates :priority, :description, :presence => true
  validates :priority, :description, :uniqueness => true
end
