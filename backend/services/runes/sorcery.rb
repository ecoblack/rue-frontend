class Sorcery < Rune
end

class Artefact < Sorcery
  def nullifying_orb
  end

  def manaflow_band
  end

  def nimbus_cloak
  end
end

class Excellence < Sorcery
  def transcendence
    #Additionally, you gain either 1.2 bonus Attack Damage or 2 Ability Power (Adaptive) for every
    #Cooldown reduction icon 1% cooldown reduction in excess of the cap.
    #TODO
    #cd cap
    # total cd from all items and runes

  end
end

def celerity(bonus_ms)
  #PASSIVE: All movement speed bonuses are 7% more effective on you.
  #   Additionally, you gain 1% bonus movement speed.
  bonus_ms = bonus_ms * 1.07
  bonus_ms = bonus_ms * 1.01

end

def absolute_focus rune
  #PASSIVE: Gain 1.8 − 18 (based on level) bonus Attack Damage or 3 − 30 (based on level) Ability Power (Adaptive)
  # while above 70% of your maximum health.
  adaptive ? average_per_level(1.8, 18, @level) : average_per_level(3, 30, @level)
end

end


class Power < Sorcery

  def waterwalking
    #add 25 ms
    @level = 18
    perlevel = average_per_level(3, 18, @level)
    #
    # 3 − 18 (based on level) bonus Attack Damage
    "#{(3 - ((18.0 - 3) / 18.0) + perlevel).round(2)} + at level #{@level}"
    #or

    # 5 − 30 (based on level) Ability Power (Adaptive).
  end

  def scorch
    #PASSIVE: Your next ability hit sets champions on fire dealing 15 − 35 (based on level) bonus magic damage after 1 second.
    #Cooldown
    #10 seconds

    p average_per_level(15, 35, 18)
  end

  def gathering_storm
    x = 1 + 3
    # 8 for AP, 4.8 for AD
    8 * x * (x - 1) / 2
  end
end
ok = {}
x = Power.new
y = Sorcery.new
y.average_per_level(30, 100, 18)
x.waterwalking
x.scorch
