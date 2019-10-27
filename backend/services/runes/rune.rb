class Rune

  def adaptive
    #if BONUS_AP > BONUS_AD
    # AP
    puts 'ADAPTIVE'
  end

  def average_per_level(first, last, level)
    adaptive = 'AP'
    res = (last - first).fdiv(18)
    p "#{((first - res) + (res * (level + 1)))}" + " Bonus #{adaptive} at level #{level}"
    res
  end
end