class Project < ActiveRecord::Base

	belongs_to :category
	belongs_to :owner, :foreign_key => "owner_id", :class_name => "User"

	has_many :contributions

	validates	:title, :description, :goal_in_dollars, :start_date, :finish_date, :owner_id, :presence => true
  validates :goal_in_dollars, :numericality => {:only_integer => true}

  validates :finish_date, :date => {:after => :start_date, :message => "must be after Start Date"}
  validates :public_date, :date => {:after_or_equal_to => :start_date, :message => "must be after or equal to Start Date" }

  delegate :first_name, :to => :owner, :prefix => true

  def total_contributions
  	contributions.sum(:amount_in_dollars)
  end

  def percentage_of_goal
    percentage = (total_contributions.to_f / goal_in_dollars.to_f ) * 100
    sprintf("%.0f", percentage)    
  end

  def days_until_close
    [(finish_date - start_date).to_i , 0].max
  end
end
