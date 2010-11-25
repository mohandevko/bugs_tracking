class UserprojectsController < ApplicationController

	def list
		@userprojects = Userproject.find_all
	end
	
	def new
		@userproject = Userproject.new
		@userproject.user_id = params[:user_id]
		@users = User.find_all
		@projects = Project.find_all
	end
	
	def create
		@userproject = Userproject.new(params[:userproject])
		if @userproject.save
			redirect_to :controller=>"userprojects", :action=>"list"	
		else
			@users = User.find_all
			@projects = Project.find_all
			render :action=>"new"
		end
	end
	
	def edit
		@users = User.find_all
		@projects = Project.find_all
		@userproject = Userproject.find(params[:id])
	end	
	
	def update
		@userproject = Userproject.find(params[:id])
		if @userproject.update_attributes(params[:userproject])
			redirect_to :controller=>"userprojects", :action=>"list"
		else
			@users = User.find_all
			@projects = Project.find_all
			render_to :action=>"edit"
		end
	end
	
	def delete
		Userproject.find(params[:id]).destroy
		redirect_to :action => "list"
	end
end
