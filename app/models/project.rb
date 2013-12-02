class Project < ActiveRecord::Base
	belongs_to :user
	has_many :contributions
	validates :name, :description, :deadline, :presence => true
	validates :total_cost, :numericality => {:only_integer => true, :greater_than => 0}
end
