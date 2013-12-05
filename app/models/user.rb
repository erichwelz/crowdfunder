class User < ActiveRecord::Base

	authenticates_with_sorcery!
	
	has_many :projects, :class_name => "Project", :foreign_key => "owner_id"
	has_many :contributions




	has_attached_file :avatar, :styles => { 
		  :mini => "30x30>",
	   	:medium => "300x300>",
	   	:thumb => "100x100#" }, :default_url => '/images/:attachment/missing_:style.png'
	   	

 	
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email

	def user_total_contributions
		contributions.sum(:amount_in_dollars)
	end

	def full_name
		full_name = first_name.capitalize + " " + last_name.capitalize 
	end	

end
