class CommentController < ApplicationController

	def list
		@comments = Comment.find_all
	end
	
	def new
		@comment = Comment.new
		@bugs = Bug.find_all
		@users = User.find_all
	end
	
	def create
		@comment = Comment.new(params[:comment])
		if @comment.save
			flash[:notice] = "comment created successfully"
			redirect_to :controller=>"comment", :action=>"list"
		else
			render :action=>"new"
		end
	end
	
	def edit
		@comment = Comment.find(params[:id])
	end
	
	def update
		@comment = Comment.find(params[:id])
		if @comment.update_attributes(params[:mohan])
			flash[:notice] = "comment updated successfully"
			redirect_to :controller=>"comment", :action=>"list"
		else
			render :action=>"edit"
		end
	end
	
	def delete
		@comment = Comment.find(params[:id])
		@comment.destroy
		flash[:notice] = "comment delleted successfully"
		redirect_to :action=>"list"
	end
	

end
