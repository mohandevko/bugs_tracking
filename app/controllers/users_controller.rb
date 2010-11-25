class UsersController < ApplicationController

def list
		@users = User.find_all
	end
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:notice] = "User created successfully"
			redirect_to :controller=>"users", :action=>"list"
		else
			render :action => "new"
		end
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:notice] = "Updated successfully"
			redirect_to :controller=>"users", :action=>"list"
		else
			render :action => "edit"
		end
		
	end
	
	def delete
		@user = User.find(params[:id])
		@user.destroy
		redirect_to :action=>"list"
	end
	
	def show
		@user = User.find(params[:id]) 
		@comments = Comment.find_all_by_user_id(@user.id)
		flash[:notice] = "Bug created successfully"
	end
	
	
	def profile
		@user = User.find(params[:id]) 
		@userprojects = Userproject.find_all_by_user_id(@user.id)
		userproject_ids = @userprojects.collect{|userproject| userproject.project_id}
		@projects = Project.find_all_by_id(userproject_ids)
		@comments = Comment.find_all_by_user_id(@user.id)
	end
	
	def list_by_designation
		@users = User.find_all_by_designation(params[:designation])
		render :action=>"list"
	end
	
	def list_by_name
		@users = User.find_all_by_name(params[:name])
		render :action=>"list"
	end
end
