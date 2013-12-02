module ContributionsHelper
	def total_contributions(contributions)
		return contributions.inject(0){|sum, c| sum + c.amount}
	end
end




