class Pizza < ActiveRecord::Base
	has_and_belongs_to_many :ingridient
	has_and_belongs_to_many :order

	scope :base_select, -> {select(:id, :name)}

	def self.select_values
		self.base_select.map { |pizza| [pizza.name, pizza.id]}
	end
end
