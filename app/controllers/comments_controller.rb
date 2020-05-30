class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @user_of_game = @comment.game.user_id
    @comment.save
    redirect_to game_path(@comment.game.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, game_id: params[:game_id])
  end
end
