class PostsController < ApplicationController

  before_action :require_postmaster, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def update
    @post = Post.find_by(id: params[:id])

    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy if @post
    redirect_to sub_url(params[:sub_id])
  end
    
  def require_postmaster
    # if current_user.id == params[:user_id]
    if current_user.posts.find_by(id: params[:id])
      return
    else
      render json: 'Forbidden'
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end


end
