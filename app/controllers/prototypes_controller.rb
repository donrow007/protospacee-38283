class PrototypesController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.all
  end



  def new
    @prototype = Prototype.new
  end


  def create
    Prototype.create(prototype_params)
  end

  private
  def prototype_params
    params.require(:prototype).permit(:name, :image, :text)
  end


  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end