module ProjectsHelper

	def display_date(deadline)
		"#{deadline.strftime('%m/%d/%Y')}"
	end
end
