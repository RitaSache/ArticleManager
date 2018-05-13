class AuthorsController < ApplicationController
	def index
      @authors = Author.all
    end

	def new 
      @author = Author.new
	end

	def edit
	  @author = Author.find(params[:id])
	end

	def show
	  @author = Author.find(params[:id])
	end

	def create
	  @author = Author.new(author_params)
 	  if @author.save
    	redirect_to authors_path
  	  else
    	render 'new'
  	  end
	end

	def update
	  @author = Author.find(params[:id])
	  @author.update(author_params)
	  redirect_to authors_path
	end

	def destroy
	  @author = Author.find(params[:id])
	  @author.destroy
	 
	  redirect_to authors_path
	end

	private
  	  def author_params
      params.require(:author).permit(:name)
  	end	
	
end
