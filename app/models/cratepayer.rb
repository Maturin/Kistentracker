class Cratepayer < ActiveRecord::Base
  belongs_to :teammate
  has_many :crate 

  validates :name, :presence => true, :uniqueness => true
end
