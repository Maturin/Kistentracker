class Craterpayer < ActiveRecord::Base
  belongs_to :teammate
  has_many :crater 

  validates :name, :presence => true, :uniqueness => true
end
