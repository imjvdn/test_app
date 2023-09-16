class ArticlesController < ApplicationController
  # Commented out to disable user authentication
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # Existing before_action to set the article
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: %i[show edit update destroy]

  # Existing index method
  def index
    if params[:search]
      @articles = Article.where("title LIKE ?", "%#{params[:search]}%")
    else
      @articles = Article.order(created_at: :desc)
    end
  end

  # Existing show method
  def show
  end

  # Existing new method
  def new
    @article = Article.new
  end

  # Existing edit method
  def edit
  end

  # Modified create method
  def create
    @article = current_user.articles.build(article_params)
  
    if @article.save
      redirect_to article_url(@article), notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Existing update method
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # Existing destroy method
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Existing private methods
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
