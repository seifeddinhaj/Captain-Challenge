# frozen_string_literal: true
class BattlesController < ApplicationController
  before_action :set_battle, only: %I[show]

  def index
    @battles = Battle.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def new
    set_form_variables
    @battle = Battle.new
  end

  def create
    @battle = Battle.new(battle_params)
    if @battle.valid?
      set_equipments_for_characters
      battle_service = BattleService.new(@character1, @character2, @battle)
      @battle.winner, @battle.loser = battle_service.fight
      if @battle.save
        redirect_to @battle, notice: "Le Gagnant est #{@battle.winner.name}."
      else
        set_form_variables
        render :new
      end
    else
      set_form_variables
      render :new
    end
  end

  def show; end

  private

  def set_form_variables
    @characters = Character.all
    @weapons = Weapon.all
    @shields = Shield.all
  end

  def set_battle
    @battle = Battle.find(params[:id])
  end

  def battle_params
    params.require(:battle).permit(:character1_id, :character2_id)
  end

  def set_equipments_for_characters
    @character1 = Character.find(battle_params[:character1_id])
    @character2 = Character.find(battle_params[:character2_id])
    @character1.update(shield_id: params[:battle][:shield1_id], weapon_id: params[:battle][:weapon1_id])
    @character2.update(shield_id: params[:battle][:shield2_id], weapon_id: params[:battle][:weapon2_id])
  end
end
