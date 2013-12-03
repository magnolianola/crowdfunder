class User < ActiveRecord::Base
	has_secure_password
	has_many :projects
	has_many :contributions
	has_many :project_updates
end
