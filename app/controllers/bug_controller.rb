class BugController < ApplicationController
	def list
		@bugs = Bug.find_all
	end
	
	def new
		@bug = Bug.new
		@bug.project_id = params[:project_id]
		@bug.user_id = params[:user_id]
		@projects = Project.find_all
		@users = User.find_all
	end
	
	def create	
		@bug = Bug.new(params[:bug])
		if @bug.save
			flash[:notice] = "Bug created successfully"
				#redirect_to :controller=>"projects", :action=>"show"
				redirect_to :controller=>"projects", :action=>"list", :id=>@bug.project_id
		else
			render :action=>"new"
		end
	end

	def edit
		@bug = Bug.find(params[:id])
	end
	
	def update
		@bug = Bug.find(params[:id])
		if @bug.update_attributes(params[:bug])
			flash[:notice] = "bug updated successfully"
			redirect_to :controller=>"projects", :action=>"show", :id=>@bug.project_id
		else
			render :action=>"edit"
		end
	end
	
	def delete
		@bug = Bug.find(params[:id])
		@bug.destroy
		flash[:notice] = "user deleted successfully"
		redirect_to :action=>"list"
	end
	
	def comment_list
		@bug = Bug.find(params[:id])
		@comments = Comment.find_all_by_bug_id(@bug.id)
	end
	
	def show
		@bug = Bug.find(params[:id])
		@comments = Comment.find_all_by_bug_id(@bug.id)
		flash[:notice] = "comment created successfully"
	end
end





