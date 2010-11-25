class Bug < ActiveRecord::Base
	has_many :comments
	belongs_to :project
	belongs_to :user
end
	
