# class CommentsController < ApplicationController

#   before_action :set_comment, only: [:update,:destroy,:restore]
#   before_action :check_user, only: [:update,:destroy,:restore]

#   def create
#     @comment = Comment.new(comment_params)
#     # @user_of_game = User.find(@comment.game.user_id)
#     if @comment.save
#       respond_to do |format|
#         format.json
#     end
#     else
#      flash[:alert] = "保存できていません"
#      redirect_to game_path(params[:id])
#     end
#   end

#   def update
#     @comment.update(delete_check:1)
#     # redirect_to game_path(@comment.game.id)
#   end

#   def destroy
#     @comment.destroy
#     # redirect_to game_path(@comment.game.id)
#   end

#   def restore
#     @comment.update(delete_check:0)
#     @user_of_game = User.find(@comment.game.user_id)
#     respond_to do |format|
#       format.json
#   end
# end

# private
#   def set_comment
#     @comment = Comment.find(params[:id])
#   end

#   def comment_params
#     params.require(:comment).permit(:comment,:game_id).merge(user_id: current_user.id)
#   end

#   def check_user
#     unless @comment.game.user == current_user
#       flash[:alert] = "その操作はできません"
#       redirect_to root_path
#     end
#   end
# end
