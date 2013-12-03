class ProjectUpdate < ActiveRecord::Base
	belongs_to :project
	belongs_to :user
	validates :comment, :presence => true
end
