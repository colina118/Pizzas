class Branch < ActiveRecord::Base
	has_many :employee
	has_many :order
	has_many :manager

	scope :base_select, -> {select(:id, :adress)}

	def self.select_values
		self.base_select.map { |branch| [branch.adress, branch.id]}
	end
end
