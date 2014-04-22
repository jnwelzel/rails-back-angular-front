class Api::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(safe_params)
    if comment.persisted?
      render json: comment, status: 200
    else
      render nothing: true, status: 500
    end
  end

  def destroy
  end

private
  def safe_params
    params.require(:comment).permit(:name, :email, :content)
  end

end
