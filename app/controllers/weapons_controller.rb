# frozen_string_literal: true
class WeaponsController < ApplicationController
  before_action :set_weapon, only: [:show, :edit, :update, :destroy]

  # GET /weapons
  def index
    @weapons = Weapon.all.paginate(page: params[:page], per_page: 10)
  end

  # GET /weapons/1
  def show; end

  # GET /weapons/new
  def new
    @weapon = Weapon.new
  end

  # GET /weapons/1/edit
  def edit; end

  # POST /weapons
  def create
    @weapon = Weapon.new(weapon_params)

    if @weapon.save
      redirect_to @weapon, notice: 'Weapon was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /weapons/1
  def update
    if @weapon.update(weapon_params)
      redirect_to @weapon, notice: 'Weapon was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /weapons/1
  def destroy
    @weapon.destroy
    redirect_to weapons_url, notice: 'Weapon was successfully destroyed.'
  end

  private

  def set_weapon
    @weapon = Weapon.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def weapon_params
    params.require(:weapon).permit(:name, :attack_bonus)
  end
end
