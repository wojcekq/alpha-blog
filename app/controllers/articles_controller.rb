class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end
    
    def edit
        
    end
    
    def update
        
        
        if @article.update(article_params)
            flash[:notice] = "Article was successfully update"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
        
    end
    
    def create
       #render plain: params[:article].inspect 
       ##@article = Article.new(article_params)
       ##@article.save
       ##redirect_to articles_path(@article)
       
       @article = Article.new(article_params)
       
       if @article.save
         #do this when article was created
         flash[:notice] = "Article was successfully created"
         redirect_to article_path(@article)
       else
           #validations failed and article was unable to be saved
           render 'new'
       end
    end
    
    def show
       
    end
    
    def destroy
       
       @article.destroy
       
       flash[:notice] = "Article was successfully deleted"
       redirect_to articles_path
    end
    
    # ======================================= #
    
    private
    
    def set_article
        @article = Article.find(params[:id])
    end
    
    def article_params
       params.require(:article).permit(:title,:description) 
    end
    
end