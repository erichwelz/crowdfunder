class Contribution < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	validates :amount_in_dollars, :presence => true
	validates :amount_in_dollars,  :numericality => {:only_integer => true}

  # scope :with_completed_goals, -> {self.joins(:project).where("contributions.amount_in_dollars >= projects.goal_in_dollars")}
		
    def self.with_completed_goals
      self.joins(:project).where("contributions.amount_in_dollars >= projects.goal_in_dollars")     
    end
	
end	
