class Product < ApplicationRecord
	has_many :line_items
	before_destroy :not_referenced_by_any_line_item


	private

	def not_referenced_by_any_line_item
		unless line_items.empty?
			errors.add(:base, "Line Items Present")
			throw :abort
		end
	end
end
