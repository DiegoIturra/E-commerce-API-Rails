class ArticlesController < ApplicationController
    
    def create
        @article = Article.new(article_params)

        if @article.save
            render json: @article, status: :created
        else
            render json: @article.errors, status: :unprocessable_entity
        end
    end

    def index
        @articles = Article.all
        render json: @articles
    end

    def show
        @article = Article.find(params[:id])
        render json: @article, status: :ok

        rescue ActiveRecord::RecordNotFound
            render json: { error: 'Record not found' }, status: :not_found
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        head :no_content
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            render json: @article
        else
            render json: @article.errors, status: :unprocessable_entity
        end
    end

    def destroy_all_articles
        Article.destroy_all
        head :no_content
    end

    private
    def article_params
        params.require(:article).permit(:title, :description, :price, :image_url)
    end



end
