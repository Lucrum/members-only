class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    puts "SESSION::   #{User.find(current_user.id).username}"
    @author_name = User.find(current_user.id).username
    @post.user_id = current_user.id
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :user_id, :content)
  end
end
