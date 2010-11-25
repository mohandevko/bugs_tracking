class User < ActiveRecord::Base
	#validation
	validates_presence_of :name
	validates_presence_of :designation
	
	#association
	has_many :userprojects 
	has_many :projects, :through=>:userprojects
	has_many :bugs
	has_many :comments
end
