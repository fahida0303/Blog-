class ArticlesController < ApplicationController
    before_action :set_article, only: [ :show, :edit, :update, :destroy]


    def new
        @article = Article.new
    end
    
    def index
        @articles = Article.all
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def create 
        #render plain: params[:article].inspect
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:success] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def show
        @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end

    def edit 
    end

    def update 
        if @article.update(article_params)
            flash[:success] = "Article was updated"
            redirect_to article_path(@article)
        else
            flash[:success] = "Article was not updated"
            render 'edit'
        end
    end
    
    def destroy
        @article.destroy
        flash[:success] = "Article was deleted"
        redirect_to articles_path
    end

    private
    def article_params
        params.require(:article).permit( :title, :descriptio)
    end

    def set_article
        @article = Article.find(params[:id])
    end
end