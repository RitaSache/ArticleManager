class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "rita", password: "secret", except: [:index, :show]

	def index
	    @articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
  		@article = Article.find(params[:id])
  	end		

	def create
		@article = Article.new(article_params)
		# logger.debug "Params: #{params.inspect}"
		tag_references = params[:article][:tags]
	  		.select { |t| t != "" } 
	  		.map { |id| TagReference.new(article: @article, tag: Tag.find(id)) }

	  	@article.tag_references = tag_references

 	 	if @article.save
    		redirect_to @article
  		else
    		render 'new'
  		end
	end

	def update
	  @article = Article.find(params[:id])
	  logger.debug "Article Params: #{article_params.inspect}"
	  tag_references = params[:article][:tags]
	  		.select { |t| t != "" } 
	  		.map { |id| TagReference.new(article: @article, tag: Tag.find(id)) }

	  @article.tag_references = tag_references
	  
	 
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end	

	def show
		@article = Article.find(params[:id])
	end

	def destroy
	  @article = Article.find(params[:id])
	  @article.destroy
	 
	  redirect_to articles_path
	end	

	def search
	  if request.post? and !params[:query].empty?
	    @articles = Article
	    	.joins(:tags)
	    	.where("title LIKE ? OR text LIKE ? OR tag LIKE ? ", 
	    		"%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%"
    		).group('id')
	  else
		@articles = Article.none
	  end
	  # If GET, @articles = Article.none
	  # If POST, @articles = Article.where
	end

	def Report

		report = CSV.generate(headers: true) do |csv|
			csv << ['id', 'title', 'tags']
			Article.includes(:tags).left_outer_joins(:tags).distinct.all.each do |article|
				tags = article.tags.pluck(:tag).join(',')
				csv << article.attributes.values_at('id', 'title').push(tags)
			end
		end
		
		respond_to do |format|
			format.csv { send_data report }
		end	
	end

	private
  		def article_params
    	params.require(:article).permit(:title, :text)
  	end
end
