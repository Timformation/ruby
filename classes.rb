############################################################
#
# Name:         Timothy Sirchuk
# Assignment:   Classes
# Date:         04/19/2017
# Class:        CIS 282 Ruby Programming (I)
# Description:  Contains Classes for: person, address and character
#
############################################################

def display_all_info(tim, tim_address, tim_character)
  puts
  puts "Person Object:"
  puts
  puts tim
  puts

  puts
  puts "Address Object:"
  puts
  puts tim_address
  puts

  puts
  puts "Character Object:"
  puts
  puts tim_character
  puts

end

################################### Person Class #####################################
class Person
  def initialize(first_name, last_name, age, hair_color, eye_color)
    @first_name = first_name
    @last_name = last_name
    @age = age
    @hair_color = hair_color
    @eye_color = eye_color
  end

  def first_name #Getter
    return @first_name
  end

  def first_name=(first_name) #Setter
    @first_name = first_name
  end

  def last_name
    return @last_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def age
    return @age
  end

  def age=(age)
    @age = age
  end

  def hair_color
    return @hair_color
  end

  def hair_color=(hair_color)
    @hair_color = hair_color
  end

  def eye_color
    return @eye_color
  end

  def eye_color=(eye_color)
    @eye_color = eye_color
  end

  def to_s
    "\tThis is #{@first_name} #{@last_name}. They are #{@age} years old. They have #{@hair_color} hair and #{@eye_color} eyes."
  end
end


################################### Address Class #####################################
class Address
  def initialize(line1, line2, city, state, zip)
    @line1 = line1
    @line2 = line2
    @city = city
    @state = state
    @zip = zip
  end

  def line1
    return @line1
  end

  def line1=(line1)
    @line1 = line1
  end

  def line2
    return @line2
  end

  def line2=(line2)
    @line2 = line2
  end

  def city
    return @city
  end

  def city=(city)
    @city = city
  end

  def state
    return @state
  end

  def state=(state)
    @state = state
  end

  def zip
    return @zip
  end

  def zip=(zip)
    @zip = zip
  end

  def to_s
    "\t\t#{@line1}
    \t#{@line2}
    \t#{@city}, #{@state}    #{@zip}"
  end

end

################################### Character Class #####################################

class Character
  def initialize(name, race, hit_points, gold)
    @name = name
    @race = race
    @hit_points = hit_points
    @gold = gold
    @weapons = []
    @clothing = []
  end

  def name
    return @name
  end

  def name=(name)
    @name = name
  end

  def race
    return @race
  end

  def race=(race)
    @race=race
  end

  def hit_points
    return @hit_points
  end

  def hit_points=(hit_points)
    @hit_points = hit_points
  end

  def gold
    return @gold
  end

  def gold=(gold)
    @gold = gold
  end

  def add_weapon(weapon_name)
    @weapons << weapon_name
  end

  def drop_weapon(weapon_name)
    @weapons.delete(weapon_name)
  end

  def add_clothing(clothing_name)
    @clothing << clothing_name
  end

  def drop_clothing(clothing_name)
    @clothing.delete(clothing_name)
  end

  def to_s
    "\tThe character standing before you is named #{@name}. They are of the #{@race} race.
    Judging by the jingle of their purse, it sounds like they have about #{@gold} gold.
    \n\tThey are carrying: \n\t#{@weapons.join(",\n\t")}. \n\n\tThey are wearing:\n\t#{@clothing.join(",\n\t")}."
  end
end

############################# Creating Objects from Classes #####################################


###### Creating a Person ######
tim = Person.new("Tim", "Sirchuk", 36, "gray", "brown")
puts tim.inspect
puts tim

###### Testing Person setters ######
tim.first_name = "Jack"
tim.last_name = "Sparrow"
tim.age = 57
tim.hair_color = "black"
tim.eye_color = "green"


###### Creating an Address ######
tim_address = Address.new("555 Cool St.", "Apt 999", "Spokane", "WA", 99207)
puts tim_address.inspect
puts tim_address

###### Testing Addresss setters ######
tim_address.line1 = "777 Las Vegas Blvd."
tim_address.line2 = "Las Vegas"
tim_address.state = "NV"
tim_address.zip = 99099

###### Creating a Character ######
tim_character = Character.new("Tim", "Swamp Ogre", 500, 3)
puts tim_character.inspect
puts tim_character

###### Testing Character setters ######
tim_character.name = "Ug"
tim_character.race = "Giant"
tim_character.hit_points = 777
tim_character.gold = 2

###### Adding to Weapons Array ######
tim_character.add_weapon("Tree Trunk")
tim_character.add_weapon("Demonic Pitchfork")
tim_character.add_weapon("Golden Broadsword")

###### Adding to Clothing Array ######
tim_character.add_clothing("Giant-hair Vest")
tim_character.add_clothing("Giant-Hair Pants")
tim_character.add_clothing("Sunstone Wristband")
tim_character.add_clothing("Platinum Ring")
tim_character.add_clothing("Steel-toed Boots")
tim_character.add_clothing("Gnarled Leather Gauntlets")
tim_character.add_clothing("Battered Horned Helmet")

############################# Display Created Objects (Pre-Drop Method) #####################################
display_all_info(tim, tim_address, tim_character)

tim_character.drop_weapon("Golden Broadsword")
tim_character.drop_clothing("Sunstone Wristband")

############################# Display Created Objects (Post-Drop Method) #####################################
display_all_info(tim, tim_address, tim_character)

#Now the Golden Broadsword (weapon) and the Sunstone wristband (clothing) are no longer inside their arrays.