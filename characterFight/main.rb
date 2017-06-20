############################################################
#
# Name:         Timothy Sirchuk
# Assignment:   Character Fight
# Date:         05/15/2017
# Class:        CIS 283 Ruby Programming (II)
# Description:  Two character files will fight to the death!
#
############################################################

require_relative("Menu")
require_relative("Character")
require_relative("Die")
require_relative("Item")

d4 = Die.new(4)
d8 = Die.new(8)
d10 = Die.new(10)
d15 = Die.new(15)

def fight1 (c1, c2, d4, d8, d10, d15, weapon, c2_armor)
  puts c1.fight
  if d10.roll < c1.agility
    hit = (c1.strength * (1.0/d4.roll) + (weapon.damage_hits/d8.roll)).to_i
    armor_save = (c2_armor.protection_hits/d15.roll).to_i
    damage = (hit - armor_save)
    if damage < 0
      damage = 0
    end
    c2.reduce_hits(damage)

    puts "Hit: #{hit}   #{c2.name}'s armor saved #{armor_save} points."
    puts "#{c2.name}'s hits are reduced by #{damage}."
    puts "#{c2.name} has #{c2.current_hits} out of #{c2.hit_points} hit points left."

  else
    puts "Misses!"
  end
end

def fight2 (c2, c1, d4, d8, d10, d15, weapon, c1_armor)
  puts c2.fight
  if d10.roll < c2.agility
    hit = (c2.strength * (1.0/d4.roll) + (weapon.damage_hits/d8.roll).to_i).to_i
    armor_save = (c1_armor.protection_hits/d15.roll).to_i
    damage = (hit - armor_save)
   if damage < 0
     damage = 0
    end
    c1.reduce_hits(damage)
    puts "Hit: #{hit}   #{c1.name}'s armor saved #{armor_save} points."
    puts "#{c1.name}'s hits are reduced by #{damage}."
    puts "#{c1.name} has #{c1.current_hits} out of #{c1.hit_points} hit points left."
  else
    puts "Misses!"
  end
end


menu = Menu.new("Load Character 1",
                "Load Character 2",
                "Fight",
                "Quit"
)

while ((user_selection = menu.get_menu_choice) != menu.quit)
  puts "You chose: #{user_selection}"

  case user_selection

    when 1
      puts "Enter the name of the character you want to load: "
      char_name = gets.chomp.downcase

      puts "Loading character 1..."


      character_file = File.open("#{char_name}.txt")


      line1 = character_file.gets.chomp
      line2 = character_file.gets.chomp
      line3 = character_file.gets.chomp

      character_file.close

      character_attributes = line1.split(",")
      weapon_attributes = line2.split(",")
      armor_attributes = line3.split(",")


      weapon1 = Weapon.new(weapon_attributes[0], weapon_attributes[1].to_i)
      armor1 = Armor.new(armor_attributes[0], armor_attributes[1].to_i)
      character_1 = Character.new(character_attributes[0],
                                  character_attributes[1],
                                  character_attributes[2].to_i,
                                  character_attributes[3].to_i,
                                  character_attributes[4].to_i,
                                  weapon1,
                                  armor1
      )

      if character_1.hit_points > 100
        character_1.hit_points = 100
      end

      if character_1.strength > 50
        character_1.strength = 50
      end

      if character_1.agility > 10
        character_1.agility = 10
      end

      puts "Character 1 (#{character_1.name}) has been loaded and is ready to fight.\n\n"

      puts character_1





    when 2

      puts "Enter the name of the character you want to load: "
      char_name = gets.chomp.downcase

      puts "Loading character 2..."

      character_file = File.open("#{char_name}.txt")

      line1 = character_file.gets.chomp
      line2 = character_file.gets.chomp
      line3 = character_file.gets.chomp

      character_file.close

      character_attributes = line1.split(",")
      weapon_attributes = line2.split(",")
      armor_attributes = line3.split(",")


      weapon2 = Weapon.new(weapon_attributes[0], weapon_attributes[1].to_i)
      armor2 = Armor.new(armor_attributes[0], armor_attributes[1].to_i)

      character_2 = Character.new(character_attributes[0],
                                  character_attributes[1],
                                  character_attributes[2].to_i,
                                  character_attributes[3].to_i,
                                  character_attributes[4].to_i,
                                  weapon2,
                                  armor2
      )
      if character_2.hit_points > 100
        character_2.hit_points = 100
      end

      if character_2.strength > 50
        character_2.strength = 50
      end

      if character_2.agility > 10
        character_2.agility = 10
      end

      puts "Character 2 (#{character_2.name}) has been loaded and is ready to fight.\n\n"

      puts character_2




    when 3

      puts "And the fight begins...\n"


      until character_1.current_hits == 0 || character_2.current_hits == 0

        c1_roll = character_1.roll
        c2_roll = character_2.roll

        if c1_roll > c2_roll

          fight1(character_1, character_2, d4, d8, d10, d15, character_1.weapon, character_2.armor)
          unless (character_1.current_hits == 0 || character_2.current_hits == 0)
          fight2(character_2, character_1, d4, d8, d10, d15, character_2.weapon, character_1.armor)
          end

        elsif c1_roll < c2_roll

          fight2(character_2, character_1, d4, d8, d10, d15, character_2.weapon, character_1.armor)
          unless (character_1.current_hits == 0 || character_2.current_hits == 0)
          fight1(character_1, character_2, d4, d8, d10, d15, character_1.weapon, character_2.armor)
          end


        else
          c1_roll = character_1.roll
          c2_roll = character_2.roll

        end
        gets
      end

      if character_1.current_hits == 0
        puts
        puts "#{character_2.name} WINS!"
        puts "------------------"
      else
        puts
        puts "#{character_1.name} WINS!"
        puts "--------------------"

      end

      puts character_1.current_status
      puts character_2.current_status
      puts "--------------------"
      puts
      character_1.revive_character
      character_2.revive_character


    when 4
      puts "Closing the program..."
  end
end