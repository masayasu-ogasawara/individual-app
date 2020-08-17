class GamesController < ApplicationController
  before_action :set_game,    only: [:show]
  before_action :move_to_sign_in,except: [:index,:show]

  def index
    @games = Game.all
    @newgames = Game.includes(:images).order("created_at DESC")
    @newgames = Game.all.page(params[:page]).per(3)
  end

  def new
    @game = Game.new
    @game.images.build
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save
      redirect_to root_path
    else
      redirect_to new_game_path
    end
  end

  def show
    @game = Game.find(params[:id])
    @comments = @game.comments
    @comment = Comment.new

  end

  def update
  end

  def destroy
    if @game.destroy
       redirect_to root_path
    else
      render :show
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :introduction, images_attributes:[:url,:_destroy, :id]).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
