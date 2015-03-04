module ValidationHelper

  def check_min_max
  	if max != 0 && min >= max
  		errors.add(:max, "is Lower then Min")
  		errors.add(:min, "is Grater then Max")
  		false
  	end
  end

  def check_cf
  	if !(cf >= 0 && cf <= 1)
  		errors.add(:cf, "is between 0 to 1")
  		false
  	end
  end

end
