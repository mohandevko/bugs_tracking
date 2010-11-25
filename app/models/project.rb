class Project < ActiveRecord::Base
	#Validations
	validates_presence_of :title, :message => "should be present"
	validates_presence_of :description
		
	#Associations
	has_many :userprojects
	has_many :users, :through=>:userprojects
	has_many :bugs
end
