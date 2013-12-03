class Contribution < ActiveRecord::Base
	belongs_to :projects
	belongs_to :users
end
