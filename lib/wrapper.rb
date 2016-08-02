

require "json"
require "pry"
require "rest-client"

class HearthstoneWrapper
  attr_reader :card_hash
  
  def initialize
    all_cards = RestClient.get('https://api.hearthstonejson.com/v1/13807/enUS/cards.collectible.json')
    @card_array = JSON.parse(all_cards)
  end

  def legendary_cards
    leg_array = []
    @card_array.each do |card_element|
      if card_element["rarity"] == "LEGENDARY"
          leg_array << card_element["name"]
        end
      end
    leg_array.uniq
  end

  def epic_cards
      epic_array = []
      @card_array.each do |card_element|
        if card_element["rarity"] == "EPIC"
            epic_array << card_element["name"]
          end
        end
      epic_array.uniq
    end

  def rare_cards
    rare_array = []
    @card_array.each do |card_element|
      if card_element["rarity"] == "RARE"
          rare_array << card_element["name"]
        end
      end
    rare_array.uniq
  end

 def common_cards
    common_array = []
    @card_array.each do |card_element|
      if card_element["rarity"] == "COMMON"
          common_array << card_element["name"]
        end
      end
    common_array.uniq
  end

end 

  ece = HearthstoneWrapper.new.common_cards
  puts ece

