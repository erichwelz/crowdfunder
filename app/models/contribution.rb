class Contribution < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	validates :amount_in_dollars, :presence => true
	validates :amount_in_dollars,  :numericality => {:only_integer => true}

  # scope :with_completed_goals, -> {self.joins(:project).where("contributions.amount_in_dollars >= projects.goal_in_dollars")}
		
    def self.with_completed_goals
      self.joins(:project).where("contributions.amount_in_dollars >= projects.goal_in_dollars") 
    end


    def self.total_funded
      funded = 0
        grouped_by =  Contribution.sum(:amount_in_dollars, :group => :project_id)
    grouped_by.each do |gp|
      Project.all.each do |proj|
          if proj.id == gp[0]
            if proj.goal_in_dollars <= gp[1]
              funded +=1
            end
          end
      end 
    end
      return funded
    end
	 
end	
