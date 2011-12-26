class Craterpayer < ActiveRecord::Base
  belongs_to :teammate
  has_many :crater 
end
