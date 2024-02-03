# frozen_string_literal: true
class BattleService
  def initialize(character1, character2, battle)
    @character1 = character1
    @character2 = character2
    @battle = battle
  end

  def fight
    log_initial_state
    perform_combat
    find_winner
  end

  private

  def conclude_battle(winner, loser)
    winner.increment!(:experience, 3)
    loser.increment!(:experience, 1)
  end

  def log_initial_state
    add_actions("État initial (points de vie) : Joueur1: #{@character1.life_points}, Joueur2: #{@character2.life_points}")
  end

  def perform_combat
    until battle_over?
      attack(@character1, @character2)
      break if battle_over?

      attack(@character2, @character1)
    end
  end

  def attack(attacker, defender)
    damage = attacker.total_attack_points
    defender.receive_damage(damage)
    log_attack(attacker, defender, damage)
  end

  def log_attack(attacker, defender, damage)
    add_actions("#{attacker.name} attaque #{defender.name} pour #{damage} dégâts. " \
                "#{defender.name}: #{defender.life_points} points restant dans sa vie")
  end

  def battle_over?
    !@character1.life_points.positive? || !@character2.life_points.positive?
  end

  def find_winner
    winner, loser = [@character1, @character2].partition { |character| character.life_points.positive? }.flatten
    add_actions("Le gagnant est #{winner.name}")
    conclude_battle(winner, loser)
    [winner, loser]
  end

  def add_actions(message)
    @battle.actions.build(description: message)
  end
end
