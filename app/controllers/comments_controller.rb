class CommentsController < ApplicationController

  before_action :set_comment, only: [:update,:destroy,:restore]
  before_action :check_user, only: [:update,:destroy,:restore]

  def create
    comment = Comment.create(comment_params)
    redirect_to "/games/#{comment.game.id}"
    # @comment = Comment.new(comment_params)
    # @comment.user_id = current_user.id
    # # @user_of_game = User.find(@comment.game.user_id)
    # if @comment.save
    #   render :show
    #   # redirect_to root_path
    # else
    #   # render :show
    #   redirect_to root_path
    # end
  end

private
  # def set_comment
  #   @comment = Comment.find(params[:id])
  # end

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, game_id: params[:game_id])
  end
end
