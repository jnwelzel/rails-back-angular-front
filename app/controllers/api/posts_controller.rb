class Api::PostsController < ApplicationController
  def index
    render json: Post.all.order("id desc"), status: 200
  end

  def create
    post = Post.new safe_params
    if post.save
      render json: post, status: 200
    else
      render nothing: true, status: 500
    end
  end

  def update
    post.update_attributes safe_params
    render nothing: true, status: 204
  end

  def show
    post = Post.find(params[:id])
    if post.nil?
      render nothing: true, status: 404
    else
      render json: post, status: 200
    end
  end

  def destroy
  end

private
  def safe_params
    params.require(:post).permit(:title, :content)
  end

end
