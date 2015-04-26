class OrdersPizza < ActiveRecord::Base
  belongs_to :order
  belongs_to :pizza
end
