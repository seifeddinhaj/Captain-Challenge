class BattleService
  def initialize(character1, character2, battle)
    @character1 = character1
    @character2 = character2
    @battle = battle
  end

  def fight
    # Boucle de combat
    add_actions("Etat initiale (points de vie) de chaque Joueur: Joueur1: #{@character1.life_points} Joueur2: #{@character2.life_points} ")

    while @character1.life_points.positive? && @character2.life_points.positive?
      # Character1 attaque character2
      @character2.receive_damage @character1.total_attack_points
      add_actions("#{@character1.name} attaque #{@character2.name} pour #{@character1.total_attack_points} dégâts. Joueur2: #{@character2.life_points} points restant dans sa vie")
      break if @character2.life_points <= 0

      # Character2 attaque character1
      @character1.receive_damage @character2.total_attack_points
      add_actions("#{@character2.name} attaque #{@character1.name} pour #{@character2.total_attack_points} dégâts. Joueur1: #{@character1.life_points} points restant dans sa vie")
    end
    # Détermination du gagnant
    winner = @character1.life_points.positive? ? @character1 : @character2
    loser = @character1.life_points <= 0 ? @character1 : @character2
    add_actions("Le gagnant est #{winner.name}")
    [winner, loser]
  end

  private
  
  def add_actions(message)
    @battle.actions.build(description: message)
  end
end
