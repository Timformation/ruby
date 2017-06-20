class Menu
  attr_accessor :quit

  def initialize(*menu_args)
    @menu_args = menu_args
    @quit = @menu_args.length
  end

  def get_menu_choice
    @menu_args.each_with_index do |item, index|
      puts "#{index + 1}) #{item}"
    end
    puts "Please select a menu option: "
    user_selection = gets.chomp.to_i

    unless user_selection.between?(1, @menu_args.length)
      puts "Make a selection from the menu that actually exists, please.\n"
    end
    return user_selection
  end
end



