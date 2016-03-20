class ArticlesController < ApplicationController
    def new
       @article = Article.new
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
       @article = Article.find(params[:id]) 
    end
    
    # ======================================= #
    
    private
    
    def article_params
       params.require(:article).permit(:title,:description) 
    end
    
end