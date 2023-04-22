class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]


  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    Post.create(post_parameter)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice:"削除しました"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_parameter)
      redirect_to posts_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def post_parameter
    params.require(:post).permit(:weight, :fat_percentage, :today1_id, :today1_memo, :today2_id, :today2_memo, :today3_id, :today3_memo, :memo).merge(user_id: current_user.id)
  end

end
