class Ingridient < ActiveRecord::Base
	has_and_belongs_to_many :pizza
end
