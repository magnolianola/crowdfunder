module ProjectsHelper

	def display_date(deadline)
		"by #{deadline.strftime('%m/%d/%Y')}"
	end
end
