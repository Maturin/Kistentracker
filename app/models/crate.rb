class Crate < ActiveRecord::Base
  belongs_to :cratepayer
  belongs_to :crate_priority, :foreign_key => :crate_priority_value, :primary_key => :priority
end
