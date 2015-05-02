class Client < ActiveRecord::Base
	has_many :order

	scope :base_select, -> {select(:id, :name)}

	def self.select_values
		self.base_select.map { |client| [client.name, client.id]}
	end
end

