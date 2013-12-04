class Contribution < ActiveRecord::Base
	belongs_to :projects
	belongs_to :users

	validates :amount_in_dollars,  :numericality => {:only_integer => true}


		
	
end	
