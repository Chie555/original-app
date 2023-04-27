class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]


  def index
    @posts = Post.all
    @data = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice:"削除しました"
  end

  def edit
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:start_time, :weight, :fat_percentage, :today1_id, :today1_memo, :today2_id, :today2_memo, :today3_id, :today3_memo, :image, :memo).merge(user_id: current_user.id)
  end

end
