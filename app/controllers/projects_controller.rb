class ProjectsController < ApplicationController

	def list
		@projects = Project.find_all
	end
	
	def new
		@project = Project.new
	end
	
	def create
		@project = Project.new(params[:project])
		if @project.save
			flash[:notice] = "project created successfully"
			redirect_to :controller=>"projects", :action=>"list"
		else
			render :action=>"new"
		end
	end
	
	def edit						
		@mohan = Project.find(params[:id])
	end
	
	def update
		@mohan = Project.find(params[:id])
		if @mohan.update_attributes(params[:mohan])
			flash[:notice] = "project updated successfully"
			redirect_to :controller=>"projects", :action=>"list"
		else
			render :action=>"edit"
		end
	end
	
	def delete
		@project = Project.find(params[:id])
		@project.destroy
		flash[:notice] = "project deleted successfully"
		redirect_to :action=>"list"
	end
	
	def show
		@project = Project.find(params[:id]) 
		@bugs = Bug.find_all_by_project_id(@project.id)
		flash[:notice] = "Bug created successfully"
	end
	
end
