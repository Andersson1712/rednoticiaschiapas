class ArticlesController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
    before_action :set_article, only: [:show, :edit, :update, :destroy]
  # GET /articles
  # GET /articles.json
  def myarticles
    @articles = current_user.articles.paginate(page: params[:page],per_page:6).ultimos
  end
  def articlesof
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @articles = @user.articles
  end

  def index
     @articles = Article.paginate(page: params[:page],per_page:6).ultimos
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @article.update_visit_count
    @comment = Comment.new
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'El Articulo se a destruido correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_article
        @article = Article.find_by_slug(params[:id])
      end
    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:user_id,:title, :description, :visit_count,:cover)
    end
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
