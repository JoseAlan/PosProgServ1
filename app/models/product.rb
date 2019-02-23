class Product < ApplicationRecord
	validates :name, presence: true
	validates :quantity, presence: true

	def has_nil_fields?
		self.name.nil? || self.quantity.nil?
	end
end
