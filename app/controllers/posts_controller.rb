class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new post_params
    if @post.save
      flash[:notice] = "Post criado com sucesso!"
      redirect_to posts_path
    else
      flash[:alert] = "Erro ao criar o post."
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:photo, :content)
  end
end
