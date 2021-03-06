class TagsController < ApplicationController

	def index
	  @tags = TagView.all
	end

	def edit
  	  	@tag = Tag.find(params[:id])
  	end

	def new
	  @tag = Tag.new
	end

	def create
	  @tag = Tag.new(params.require(:tag).permit(:tag))
	  @tag.save
	  redirect_to tags_path
	end

	def update
	  @tag = Tag.find(params[:id])
	  @tag.update(params.require(:tag).permit(:tag))
	  redirect_to tags_path
	end

	def show
	  @tag = Tag.find(params[:id])
	end

	def destroy
	  @tag = Tag.find(params[:id])
	  @tag.destroy
	 
	  redirect_to tags_path
	end	
end
