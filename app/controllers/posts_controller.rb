class PostsController < ApplicationController
  def index
    @posts = Post.all

    @posts_count = Post.count

    require "date"
    @day = Date.today

  end

  def show
    @post = Post.find(params[:id])
  end

  
  def new
    @post = Post.new
  end

  def create
    @post  = Post.new(params.require(:post).permit(:title, :start_date, :finish_date, :all_date, :memo))

    if @post.save
      flash[:notice] = "スケジュール登録完了"
      redirect_to "/posts"
    else
      render "posts/new"
    end

  end

  def edit 
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params.require(:post).permit(:title, :start_date, :finish_date, :all_date, :memo))
      flash[:notice] = "スケジュール編集完了"
      redirect_to "/posts"
    else
      render "posts/edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "スケジュール削除完了"
      redirect_to "/posts"
    end
  end


end
