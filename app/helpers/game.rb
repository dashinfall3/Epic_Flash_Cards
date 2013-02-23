helpers do 

  def calculate_time(seconds)
    if seconds < 60
      "You finished in #{seconds.to_i} seconds"
    elsif 60 <= seconds && seconds < 3600
      "You finished in #{seconds.to_i/60} minutes"
    elsif 3600 <= seconds && seconds < 86400
      "You finished in #{seconds.to_i/60/60} hours"
    end
  end

end
