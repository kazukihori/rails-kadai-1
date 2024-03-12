class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post  = Post.new(params.require(:post).permit(:title, :start_date, :finish_date, :all_day, :memo))

    if @post.save
      flash[:notice] = "スケジュール登録完了"
      redirect_to "/posts"
    else
      render "posts"
    end

  end
end
