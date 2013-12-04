class Project < ActiveRecord::Base
	belongs_to :user
	has_many :contributions
	has_many :project_updates
	validates :name, :description, :deadline, :presence => true
	validates :total_cost, :numericality => {:only_integer => true, :greater_than => 0}
	acts_as_taggable
end
