class Pizza < ActiveRecord::Base
	has_and_belongs_to_many :ingridient
	has_and_belongs_to_many :order

	scope :base_select, -> {select(:id, :name)}

	def self.select_values
		self.base_select.map { |pizza| [pizza.name, pizza.id]}
	end
end

def self.as_csv
	CSV.generate do |csv|
		csv << column_names
		all.each do |item|
			csv << item.attributes.values_at(*column_names)
		end
	end
end