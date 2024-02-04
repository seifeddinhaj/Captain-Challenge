# frozen_string_literal: true
class CharactersController < ApplicationController
  before_action :set_character, only: %i[ show edit update destroy ]

  def new
    @character = Character.new
  end

  def index
    @characters = Character.all.paginate(page: params[:page], per_page: 10)
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to character_url(@character), notice: "Personnage modifié avec succès." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @character.destroy
    redirect_to characters_path, notice: 'Personnage supprimé avec succès.'
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to characters_url, notice: 'Le personnage a été créé avec succès.'
    else
      render :new
    end
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :life_points, :attack_points, :avatar)
  end
end