############################################################
#
# Name:         Timothy Sirchuk
# Assignment:   Hashes Assignment
# Date:         02/21/2017
# Class:        CIS 282 Ruby Programming (I)
# Description:  This program manages an externally loaded item list
#
############################################################



product_hash = {} #product_hash = { product_code => [product_name, product_price] }

product_list = File.open("products.txt")

while product_list.eof? != true
  product = product_list.gets.chomp
  product_info = product.split(',')
  product_hash[product_info[0].to_i] = [product_info[1], product_info[2].to_f]
end
product_list.close

#At this point, I begin the main program: Draw menu, ask for input, make changes to hash, etc.

def header
  puts "Item    Description   Price"
  puts "-----   -----------   ------"
end


option_selected = 0

def menu
  prompt = "Make a selection from the menu: "
  menu_items = ["1. View All Products",
                "2. Add a new product",
                "3. Delete a product",
                "4. Update a product",
                "5. View highest priced product",
                "6. View lowest priced product",
                "7. View sum of all products",
                "8. EXIT \n\n"]
end


while option_selected != 8
  puts menu
  option_selected = gets.chomp.to_i

  case option_selected
    when 1
      header
      product_hash.each do |id, data|
        puts "#{id.to_i}     #{data[0]}          #{data[1].to_f}"
      end
      puts

    when 2
      puts "Let's enter a new product then:"
      puts "Enter the new product's name (1 word description, please):"
      new_product_name = gets.chomp

      if product_hash[new_product_name].nil? == true

        puts "Please Enter the new product's price (0.00 format):"
        new_product_price = gets.chomp.to_f

        product_code = rand(100..999).to_i
        while product_hash.has_key?(product_code)
          product_code = rand(100..999)
        end
        product_hash[product_code] = [new_product_name, new_product_price]
        puts "The new item has been added."
        puts
      else
        puts "That item already exists."
        puts
      end

    when 3
      puts "Okay, let's delete an item from the product list."
      puts "Please enter the PRODUCT CODE of the item to delete (3 digits):"
      delete_code = gets.chomp.to_i

      if product_hash[delete_code].nil? == false
        product_hash.delete(delete_code)
        puts "The item with product code \"#{delete_code}\" has been deleted from the product list."
        puts

      else
        puts "That item doesn't seem to exist, so we can't delete it from the product list."
        puts
      end

    when 4
      puts "Please enter the product code of the item you want us to update (3 digits):"
      updated_code = gets.chomp.to_i
      if product_hash[updated_code].nil? == false
        puts "Okay, enter the new product description for this item (1 word, please):"
        updated_product_name = gets.chomp

        puts "Now enter the updated price of the item (even if it hasn't changed, enter it):"
        updated_product_price = gets.chomp
        product_hash[updated_code] = [updated_product_name, updated_product_price]
        puts "Updated."
        puts

      else
        puts "That item doesn't seem to exist, so we can't update it in the product list."
        puts
      end

    when 5
      highest_product_price = 0.00
      highest_price = ""
      product_hash.each do |id, data|
        if data[1].to_f > highest_product_price.to_f
          highest_product_price = data[1]
          highest_price = "Product code: #{id}, Item description: #{data[0]}, Price: $#{data[1]}"
        end
      end

      puts "Highest priced product is:"
      puts "#{highest_price}"
      puts

    when 6
      lowest_product_price = product_hash.first[1][1]
      lowest_product_id = 0
      product_hash.each do |id, data|
        if data[1].to_f < lowest_product_price
          lowest_product_price = data[1]
          lowest_product_id = "Product code: #{id}, Item description: #{data[0]}, Price: $#{data[1]}"

        end
      end

      puts "Lowest product price is:"
      puts "#{lowest_product_id}"
      puts

    when 7
      total = 0
      product_hash.each do |id, data|
        total += data[1]
      end
      puts "Total of product prices is: $#{total}."
    when 8
      puts
      puts "Okay, closing the program."
      puts
    else
      puts "Please make a numeric selection that exists in the menu."
      puts
  end
end
revised_product_list = File.open('products.txt', 'w')
product_hash.each do |id, data|
  revised_product_list.puts "#{id},#{data[0]},#{data[1]}"
end

revised_product_list.close













