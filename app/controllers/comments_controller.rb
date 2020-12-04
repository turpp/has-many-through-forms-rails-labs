class CommentsController < ApplicationController

  def create
    # byebug
    comment = Comment.create(comment_params)
    if !params[:comment][:user_attributes][:email].blank?
    user=User.create(username: params[:comment][:user_attributes][:username], email: params[:comment][:user_attributes][:email] )
    user.comments << comment
    end
    redirect_to comment.post
    
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username, :email])
  end

end
