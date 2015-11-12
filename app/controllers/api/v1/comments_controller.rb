class Api::V1::CommentsController < Api::V1::BaseController
  before_filter :authenticate_user!, only: [:create]

  def create
    comment = Comment.new
    comment.user = @current_user
    comment.parent_id = comment_params[:parent_id]
    comment.content = comment_params[:content]
    comment.commentable_id = comment_params[:commentable_id]
    comment.commentable_type = comment_params[:commentable_type]
    if comment.save
        render( json: comment, serializer: Api::V1::CommentSerializer)
    else
        return api_error(status: 401, errors: comment.errors)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:parent_id, :content, :commentable_id, :commentable_type)
  end
end
