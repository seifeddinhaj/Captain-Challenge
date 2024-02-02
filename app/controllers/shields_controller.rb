class ShieldsController < ApplicationController
  before_action :set_shield, only: [:show, :edit, :update, :destroy]

  def index
    @shields = Shield.all
  end

  def show
  end

  def new
    @shield = Shield.new
  end

  def edit
  end

  def create
    @shield = Shield.new(shield_params)
    if @shield.save
      redirect_to shields_path, notice: 'Shield was successfully created.'
    else
      render :new
    end
  end

  def update
    if @shield.update(shield_params)
      redirect_to shields_path, notice: 'Shield was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @shield.destroy
    redirect_to shields_url, notice: 'Shield was successfully destroyed.'
  end

  private
    def set_shield
      @shield = Shield.find(params[:id])
    end

    def shield_params
      params.require(:shield).permit(:name, :defense_bonus)
    end
end
