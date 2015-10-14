class CommentsController < ApplicationController
  def index
    render json: Comment.latest(10).order(id: :desc).map{|c| c.attributes.merge({persisted: true})}.reverse
  end

  def create
    sleep 3
    Comment.create(comment_params)
    render status: :created
  end

  def options
    head :no_content
  end

  def comment_params
    params.require(:comment).permit(:author, :text)
  end
end