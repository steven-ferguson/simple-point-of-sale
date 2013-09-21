class Alcohol < Product

  def can_purchase?(birthdate)
    birthday = Date.parse(birthdate)
    cutoff = Date.today << (21 * 12)
    birthday < cutoff
  end
end