class Api::V1::ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :update, :destroy]

  #GET
  def index
    @articles = Article.all
    render json:@articles, status: 200
  end

  #GET
  def show
    begin @article
      render json: @article, status: 200
    rescue
      render json: {error: "article not found!"}
    end
  end

  #PUT/POST
  def create
    @article = Article.new(article_params)
      if @article.save
        render json: @article, status: 200
      else
        render json: {erroe: "create failed"}
      end
  end

  #PUT/POST/PATCH
  def update
    if @article.update(article_params)
      render json: @article, status: 200
    else
      render json: {erroe: "update failed"}
    end
  end

  #DELETE
  def destroy
    @article.destroy
  end

  private
  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    parmas.requir(:article).permit([
      :title,
      :author,
      :description
    ])
  end
end