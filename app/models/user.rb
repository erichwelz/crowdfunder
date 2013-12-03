class User < ActiveRecord::Base

	authenticates_with_sorcery!
	  
	has_attached_file :avatar, :styles => { 
	   	:medium => "300x300>",
	   	:thumb => "100x100#" }, :default_url => "/images/:style/missing.png"

	   	has_many :projects
		has_many :projects, :through => :contributions

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email

end
