class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def new
    @post = current_user.posts.build
  end

  def show
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path
    else 
      flash[:notice] = "Some errors!"
      render :new, status: :unprocessable_entity
    end

  end

  private

  def post_params
    params.require(:post).permit(:body, :profile_id)
  end

end
