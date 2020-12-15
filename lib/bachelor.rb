require "pry"

def get_first_name_of_season_winner(data, season)
  the_winner = data[season].find do |contestant|
    contestant["status"] == "Winner"
  end
the_winner["name"].split.first
end

def get_contestant_name(data, occupation)
  contestants = get_all_contestants(data)
  matching_contestant = find_contestant_by_attribute contestants, "occupation", occupation
  matching_contestant["name"]
end

def count_contestants_by_hometown(data, hometown)
  get_all_contestants(data).count do |contestant|
    contestant["hometown"] == hometown
  end
end

def get_occupation(data, hometown)
  get_all_contestants(data).find do |contestant|
    
    if hometown == contestant["hometown"]
      return contestant["occupation"]
    end
  end
end

def get_average_age_for_season(data, season)
  age_array = []

  data[season].select do |contestant|
  age_array << contestant["age"].to_i 
  end
  average_age = age_array.inject do|sum, el| 
    (sum + el).to_f / age_array.size
  end

  average_age
end

def find_contestant_by_attribute contestants, key, value
  contestants.find do |contestant|
    contestant[key] == value
  end
end

def get_all_contestants data
  data.values.flatten
end