require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each do |day, item|
    item.push(supply)
  end
holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, day|
    if day.include?(:memorial_day)
      day.each do |key, value|
        value.push(supply)
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  holiday_hash.each do |key, value|
    if key==season
      holiday_hash[key][holiday_name]= supply_array
    end
  end
  # remember to return the updated hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
   winter_supplies=[]
  holiday_hash[:winter].each do |holiday, supplies|
    supplies.each do |supply|
       winter_supplies.push(supply)
    end
  end
  winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  printable=""
  holiday_hash.each do |season, holiday|
    printable+="#{season.to_s.capitalize}:\n"
    holiday.each do|holiday, supplies|
      holiday_tostring=holiday.to_s.split('_').collect do |word|
        word.capitalize
      end.join(" ")
      printable+= "  #{holiday_tostring}:"
      supplies.each do |supply|
        printable+=" #{supply}"
        if supply== supplies.last
          printable+="\n"
        else
          printable+=","
        end
      end
    end

  end
  puts printable
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays=[]
  holiday_hash.each do |season, holiday|
    holiday.each do |day, supply|
      bbq_holidays.push(day) if supply.include?("BBQ")
    end
  end
  bbq_holidays
end
