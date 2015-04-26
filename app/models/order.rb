class Order < ActiveRecord::Base
  belongs_to :client
  belongs_to :branch
  has_and_belongs_to_many :pizza
end
