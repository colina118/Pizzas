class IngridientsPizza < ActiveRecord::Base
  belongs_to :pizza
  belongs_to :ingridient
end
