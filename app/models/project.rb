class Project < ActiveRecord::Base
	validates :name, :description, :presence => true
	validates :total_cost, :numericality => (:only_integer => true)

	def total_cost
		price_in_dollars = total_cost.to_f/100
		sprintf("%.2f", price_in_dollars)
	end
end
