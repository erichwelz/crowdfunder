class Project < ActiveRecord::Base

	belongs_to :category
	belongs_to :owner, :foreign_key => "owner_id", :class_name => "User"

	has_many :contributions
  has_many :reviews
  has_many :users, :through => :reviews
  has_many :breakpoints

	validates	:title, :description, :goal_in_dollars, :start_date, :finish_date, :owner_id, :presence => true
  validates :goal_in_dollars, :numericality => {:only_integer => true}

  validates :finish_date, :date => {:after => :start_date, :message => "must be after Start Date"}
  # validates :public_date, :date => {:after_or_equal_to => :start_date, :message => "must be after or equal to Start Date" }

    scope :current_project, -> {self.joins(:project).where("Date.today" >= projects.public_date")}


  delegate :first_name, :to => :owner, :prefix => true

  scope :current_projects, lambda {Project.where("current_date BETWEEN public_date AND finish_date")}
 
  def total_contributions_per_project
  	contributions.sum(:amount_in_dollars)
  end

  def percentage_of_goal
    percentage = (total_contributions_per_project.to_f / goal_in_dollars.to_f ) * 100
    sprintf("%.0f", percentage)    
  end

  def max_percentage
    if (percentage_of_goal.to_i >= 100)
      return 100
    else
      percentage_of_goal
    end   
   end

  def days_until_close
    [(finish_date - start_date).to_i , 0].max
  end

  def total_contributions
    Contribution.all.sum(:amount_in_dollars)
  end

  def get_user(contribution)
    @user = User.find_by(:id => contribution.user_id)    
  end

  def get_fully_funded_projects
    
  end


end