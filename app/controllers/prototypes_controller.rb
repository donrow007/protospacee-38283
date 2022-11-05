class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show,create]
  before_action :move_to_index, except: [:edit, :update, :destroy]
  before_action :authenticate_user!,only: [:index, :show]
  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create 
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy 
      redirect_to root_path
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render :edit
    end
  end


  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image, :user_id).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id]) 
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
