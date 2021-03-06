class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end  
  
  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice]="Article saved successfully."
      redirect_to article_path(@article)
    else #validation error  
     render 'new'
    end
  end  
  
  def edit
  end
  
  def update
    if @article.update(article_params)
      flash[:notice]="Article edited successfully."
      redirect_to article_path(@article)
    else #validation error  
     render 'edit'
    end 
  end 
  
  def destroy
    @article.destroy
    flash[:notice]="Article deleted successfully."
    redirect_to articles_path
  end  
  
  def show
  end  
    
  private
   def set_article
    @article = Article.find(params[:id])
   end   
   
   def article_params
     params.require(:article).permit(:title, :description)
   end 
  
end  