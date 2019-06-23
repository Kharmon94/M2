class Order < ApplicationRecord
	has_many :line_items, dependent: :destroy

	# has_many :line_items, :through => :products, dependent: :destroy
end
