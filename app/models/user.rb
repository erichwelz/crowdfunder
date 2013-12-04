class User < ActiveRecord::Base

	authenticates_with_sorcery!
	
	has_many :projects, :class_name => "Project", :foreign_key => "owner_id"
	has_many :contributions




	has_attached_file :avatar, :styles => { 
	   	:medium => "300x300>",
	   	:thumb => "100x100#" }, :default_url => "/images/:style/missing.png"

 	
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email

	def user_total_contributions
		contributions.sum(:amount_in_dollars)
	end
end
