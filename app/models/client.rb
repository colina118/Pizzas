class Client < ActiveRecord::Base
	has_many :order

	scope :base_select, -> {select(:id, :name)}

	def self.select_values
		self.base_select.map { |client| [client.name, client.id]}
	end

	validates :name, presence: true
	validates :lastname, presence: true
	validates :phone_number, presence: true, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
	validates :address, presence: true
end

