class Order < ActiveRecord::Base
  belongs_to :client
  belongs_to :branch
  has_and_belongs_to_many :pizza



  scope :base_select, -> {select(:id, :client_id)}

  def self.select_values
    self.base_select.map { |order| [order.client_id, order.id]}
  end
end
