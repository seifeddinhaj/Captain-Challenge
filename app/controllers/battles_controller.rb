# frozen_string_literal: true
class BattlesController < ApplicationController
  def index
    @battles = Battle.all.order(created_at: :desc)
  end

  def new
    @characters = Character.all
    @weapons = Weapon.all
    @shields = Shield.all
    @battle = Battle.new
  end

  def create
    @battle = Battle.new(battle_params)
    set_equipments_for_characters
    battle_service = BattleService.new(@character1, @character2)
    @battle.winner, @battle.loser = battle_service.fight
    # Ajoutez ici votre logique pour déterminer le gagnant et le perdant
    if @battle.save
      redirect_to battles_path, notice: "Le Gagnant est #{@battle.winner.name}"
    else
      @characters = Character.all
      @weapons = Weapon.all
      @shields = Shield.all
      render :new
    end
  end

  private

  def battle_params
    params.require(:battle).permit(:character1_id, :character2_id)
  end

  def set_equipments_for_characters
    @character1 = Character.find(battle_params[:character1_id])
    @character2 = Character.find(battle_params[:character2_id])
    @character1.update(shield_id: params[:shield1_id], weapon: params[:weapon1_id])
    @character2.update(shield_id: params[:shield2_id], weapon: params[:weapon2_id])
  end
end
