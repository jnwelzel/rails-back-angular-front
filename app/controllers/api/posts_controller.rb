class Api::PostsController < ApplicationController
  def index
    logger.info "Requesting all posts"
    render json: Post.all, status: 200
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

  def destroy
  end
end
