class BattleService
  def initialize(character1, character2)
    @character1 = character1
    @character2 = character2
  end

  def fight
    # Boucle de combat
    while @character1.life_points.positive? && @character2.life_points.positive?
      # Character1 attaque character2
      @character2.receive_damage @character1.total_attack_points
      break if @character2.life_points <= 0

      # Character2 attaque character1
      @character1.receive_damage @character2.total_attack_points
    end
    # Détermination du gagnant
    winner = @character1.life_points.positive? ? @character1 : @character2
    loser = @character1.life_points <= 0 ? @character1 : @character2
    [winner, loser]
  end
end
