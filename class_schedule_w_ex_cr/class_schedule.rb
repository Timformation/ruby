############################################################
#
# Name:         Timothy Sirchuk
# Assignment:   Text Search Program
# Date:         04/07/2017
# Class:        CIS 283 Ruby Programming (II)
# Description:  Searches schedule information using regex.
#
############################################################

schedule = File.open("enrollment.txt")
class_schedule = []

while ! schedule.eof?
  class_schedule << schedule.gets.chomp
end

schedule.close

department = ''
class_number = 0
match = []
continues = false
count = 1

until department.upcase == "EXIT"
  puts "Enter the department (include any special characters, such as '&'): "
  department = gets.chomp
  if department.upcase == "EXIT"

  else
    puts "Enter the class number: "
    class_number = gets.chomp

    class_schedule.each_with_index do |line, index|
      if line =~ /#{department.upcase}\s+#{class_number}/
        match << line

        if class_schedule[index + 1] =~ /\s{11}\S/ || class_schedule[index + 1] =~ /\s{58}/
          match << class_schedule[index + count]
          count += 1
          continues = true


          while continues
            if class_schedule[index + count] =~ /\s{11}\S/ || class_schedule[index + count] =~ /\s{58}/
              match << class_schedule[index + count]
              count += 1
              continues = true


            else
              continues = false

            end
          end
        end
      end
      puts match
      match = []
      count = 1
    end
  end
end








