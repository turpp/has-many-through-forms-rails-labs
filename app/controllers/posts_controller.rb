class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @users=User.all.collect do |user|
      [user.username, user.id]
    end
    @comment=Comment.new
    @comment.build_user

  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @a=@post.categories.build
  end

  def create
    post = Post.create(post_params)

    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end

  def comment_params
    params.require(:comment).perment(:content, user_attributes: [:username, :email])
  end
end
