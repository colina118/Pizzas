class Pizza < ActiveRecord::Base
	has_and_belongs_to_many :ingridient
	has_and_belongs_to_many :order


end
