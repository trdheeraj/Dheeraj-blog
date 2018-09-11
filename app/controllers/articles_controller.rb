class ArticlesController < ApplicationController
	def new
		@article = Article.new
	end

	def create
		# render plain: params[:article].inspect # To display the list of values passed as a parameter on submitting the form
		@article = Article.new(article_params)
		@article.save
		redirect_to article_show(@article)
	end

	private
		def article_params
			params.require(:article).permit(:title, :description)
		end
end