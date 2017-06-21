############################################################
#
# Name:         Timothy Sirchuk
# Assignment:   Mazes (Final Exam)
# Date:         03/17/2017
# Class:        CIS 282 Ruby Programming (I)
# Description:  This program will solve the maze a user selects.
#
############################################################

maze = []

def print_maze(mz) #Why doesn't this work...
  mz.each do |row|
    row.each do |cell|
      print cell
    end
    puts
  end
end

def read_maze(maze_num)
  maze = []

  mz_file = File.open("maze#{maze_num}.mz")

  while !mz_file.eof?
    maze << mz_file.gets.chomp.split('')
  end
  mz_file.close
  return maze
end

def f_finder(maze)
  f_row = 0
  f_col = 0
  row = 0
  while row < maze.count
    col = 0
    while col < maze[row].count

      if maze[row][col] == 'F'
        f_row = row
        f_col = col
      end
      col += 1
    end
    row += 1
  end

  if maze[f_row - 1][f_col] == ' '
    maze[f_row - 1][f_col] = 0
  end
  if maze[f_row + 1][f_col] == ' '
    maze[f_row + 1][f_col] = 0
  end
  if maze[f_row][f_col - 1] == ' '
    maze[f_row][f_col - 1] = 0
  end
  if maze[f_row][f_col + 1] == ' '
    maze[f_row][f_col + 1] = 0
  end
  return f_row, f_col
end


option_selected = 0

def menu
  prompt = "Select a maze to solve from the menu: "
  menu_items = ["1. Solve maze #1",
                "2. Solve maze #2",
                "3. Solve maze #3",
                "4. Solve maze #4",
                "5. Solve maze #5",
                "6. Solve maze #6",
                "7. Solve maze #7",
                "8. Solve maze #8",
                "9. Solve maze #9",
                "10. Solve maze #10",
                "11. EXIT the program."]
end

while option_selected != 11
  puts menu
  option_selected = gets.chomp.to_i

  case option_selected

    when 1
      puts "Solving maze #1!"


      maze = read_maze(option_selected)

      puts
      puts "Here's the maze:"
      puts
      print_maze(maze)

      f_finder(maze)


      f_col = 0
      f_row = 0
      target = 0
      found_s = false

      while !found_s
        row = 0
        while row < maze.count
          col = 0
          while col < maze[row].count
            if maze[row][col] == target
              if maze[row-1][col] == ' '
                maze[row-1][col] = target + 1
              end
              if maze[row+1][col] == ' '
                maze[row+1][col] = target + 1
              end
              if maze[row][col-1] == ' '
                maze[row][col-1] = target + 1
              end
              if maze[row][col+1] == ' '
                maze[row][col+1] = target + 1
              end

              # Looking NSEW for an s and if found setting flag to true:
              if maze[row][col] == target
                if maze[row-1][col] == 'S'
                  found_s = true
                  s_row = row-1
                  s_col = col
                end
                if maze[row+1][col] == 'S'
                  found_s = true
                  s_row = row+1
                  s_col = col
                end
                if maze[row][col-1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col-1
                end
                if maze[row][col+1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col+1
                end
              end
            end
            col += 1
          end
          row += 1
        end
        target += 1
      end

      #BACKTRACKING:

      row = s_row
      col = s_col
      while target > 0

        if maze[row-1][col] == target - 1
          maze[row-1][col] = '*'
          row -= 1
        end

        if maze[row+1][col] == target - 1
          maze[row+1][col] = '*'
          row += 1
        end

        if maze[row][col-1] == target - 1
          maze[row][col-1] = '*'
          col -= 1
        end

        if maze[row][col+1] == target - 1
          maze[row][col+1] = '*'
          col += 1
        end
        target -= 1

      end
      #REMOVE NUMBERS FROM MAZE:
      row = 0
      while row < maze.count
        col = 0
        while col < maze[row].count

          if maze[row][col].is_a?(Fixnum)
            maze[row][col] = ' '
          end
          col += 1
        end
        row += 1
      end

      puts
      puts "And here's the maze's solution:"
      puts
      print_maze(maze)


    when 2
      puts "Solving maze #2!"

      maze = read_maze(option_selected)

      puts
      puts "Here's the maze:"
      puts
      print_maze(maze)

      f_finder(maze)


      f_col = 0
      f_row = 0
      target = 0
      found_s = false

      while !found_s
        row = 0
        while row < maze.count
          col = 0
          while col < maze[row].count
            if maze[row][col] == target
              if maze[row-1][col] == ' '
                maze[row-1][col] = target + 1
              end
              if maze[row+1][col] == ' '
                maze[row+1][col] = target + 1
              end
              if maze[row][col-1] == ' '
                maze[row][col-1] = target + 1
              end
              if maze[row][col+1] == ' '
                maze[row][col+1] = target + 1
              end

              # Looking NSEW for an s and if found setting flag to true:
              if maze[row][col] == target
                if maze[row-1][col] == 'S'
                  found_s = true
                  s_row = row-1
                  s_col = col
                end
                if maze[row+1][col] == 'S'
                  found_s = true
                  s_row = row+1
                  s_col = col
                end
                if maze[row][col-1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col-1
                end
                if maze[row][col+1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col+1
                end
              end
            end
            col += 1
          end
          row += 1
        end
        target += 1
      end

      #BACKTRACKING:

      row = s_row
      col = s_col
      while target > 0

        if maze[row-1][col] == target - 1
          maze[row-1][col] = '*'
          row -= 1
        end

        if maze[row+1][col] == target - 1
          maze[row+1][col] = '*'
          row += 1
        end

        if maze[row][col-1] == target - 1
          maze[row][col-1] = '*'
          col -= 1
        end

        if maze[row][col+1] == target - 1
          maze[row][col+1] = '*'
          col += 1
        end
        target -= 1

      end
      #REMOVE NUMBERS FROM MAZE:
      row = 0
      while row < maze.count
        col = 0
        while col < maze[row].count

          if maze[row][col].is_a?(Fixnum)
            maze[row][col] = ' '
          end
          col += 1
        end
        row += 1
      end

      puts
      puts "And here's the maze's solution:"
      puts
      print_maze(maze)

    when 3

      maze = read_maze(option_selected)
      # maze = []
      #
      # mz_file = File.open("maze3.mz")
      #
      # while !mz_file.eof?
      #   maze << mz_file.gets.chomp.split('')
      # end
      # mz_file.close

      puts
      puts "Here's the maze:"
      puts
      print_maze(maze)

      f_row, f_col = f_finder(maze)


      # f_row = 0
      # f_col = 0
      # row = 0
      # while row < maze.count
      #   col = 0
      #   while col < maze[row].count
      #
      #     if maze[row][col] == 'F'
      #       f_row = row
      #       f_col = col
      #     end
      #     col += 1
      #   end
      #   row += 1
      #
      # end
      #
      # if maze[f_row - 1][f_col] == ' '
      #   maze[f_row - 1][f_col] = 0
      # end
      # if maze[f_row + 1][f_col] == ' '
      #   maze[f_row + 1][f_col] = 0
      # end
      # if maze[f_row][f_col - 1] == ' '
      #   maze[f_row][f_col - 1] = 0
      # end
      # if maze[f_row][f_col + 1] == ' '
      #   maze[f_row][f_col + 1] = 0
      # end


      target = 0
      found_s = false

      while !found_s
        row = 0
        while row < maze.count
          col = 0
          while col < maze[row].count
            if maze[row][col] == target
              if maze[row-1][col] == ' '
                maze[row-1][col] = target + 1
              end
              if maze[row+1][col] == ' '
                maze[row+1][col] = target + 1
              end
              if maze[row][col-1] == ' '
                maze[row][col-1] = target + 1
              end
              if maze[row][col+1] == ' '
                maze[row][col+1] = target + 1
              end

              # Looking NSEW for an s and if found setting flag to true:
              if maze[row][col] == target
                if maze[row-1][col] == 'S'
                  found_s = true
                  s_row = row-1
                  s_col = col
                end
                if maze[row+1][col] == 'S'
                  found_s = true
                  s_row = row+1
                  s_col = col
                end
                if maze[row][col-1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col-1
                end
                if maze[row][col+1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col+1
                end
              end
            end
            col += 1
          end
          row += 1
        end
        target += 1
      end

      #BACKTRACKING:

      row = s_row
      col = s_col
      while target > 0

        if maze[row-1][col] == target - 1
          maze[row-1][col] = '*'
          row -= 1
        end

        if maze[row+1][col] == target - 1
          maze[row+1][col] = '*'
          row += 1
        end

        if maze[row][col-1] == target - 1
          maze[row][col-1] = '*'
          col -= 1
        end

        if maze[row][col+1] == target - 1
          maze[row][col+1] = '*'
          col += 1
        end
        target -= 1

      end
      #REMOVE NUMBERS FROM MAZE:
      row = 0
      while row < maze.count
        col = 0
        while col < maze[row].count

          if maze[row][col].is_a?(Fixnum)
            maze[row][col] = ' '
          end
          col += 1
        end
        row += 1
      end

      puts
      puts "And here's the maze's solution:"
      puts
      print_maze(maze)


    when 4
      puts "Solving maze #4!"
      maze = read_maze(option_selected)
      print_maze(maze)
      puts
      puts "Err.. Uhh... Due to technical difficulties, this maze cannot be solved at this time. Please try again later."
      puts

    when 5

      puts "Solving maze #5!"
      maze = read_maze(option_selected)
      print_maze(maze)
      puts
      puts "Err.. Uhh... Due to technical difficulties, this maze cannot be solved at this time. Please try again later."
      puts

    when 6
      puts "Solving maze #6!"
      maze = read_maze(option_selected)

      puts
      puts "Here's the maze:"
      puts
      print_maze(maze)

      f_finder(maze)


      f_col = 0
      f_row = 0
      target = 0
      found_s = false

      while !found_s
        row = 0
        while row < maze.count
          col = 0
          while col < maze[row].count
            if maze[row][col] == target
              if maze[row-1][col] == ' '
                maze[row-1][col] = target + 1
              end
              if maze[row+1][col] == ' '
                maze[row+1][col] = target + 1
              end
              if maze[row][col-1] == ' '
                maze[row][col-1] = target + 1
              end
              if maze[row][col+1] == ' '
                maze[row][col+1] = target + 1
              end

              # Looking NSEW for an s and if found setting flag to true:
              if maze[row][col] == target
                if maze[row-1][col] == 'S'
                  found_s = true
                  s_row = row-1
                  s_col = col
                end
                if maze[row+1][col] == 'S'
                  found_s = true
                  s_row = row+1
                  s_col = col
                end
                if maze[row][col-1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col-1
                end
                if maze[row][col+1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col+1
                end
              end
            end
            col += 1
          end
          row += 1
        end
        target += 1
      end

      #BACKTRACKING:

      row = s_row
      col = s_col
      while target > 0

        if maze[row-1][col] == target - 1
          maze[row-1][col] = '*'
          row -= 1
        end

        if maze[row+1][col] == target - 1
          maze[row+1][col] = '*'
          row += 1
        end

        if maze[row][col-1] == target - 1
          maze[row][col-1] = '*'
          col -= 1
        end

        if maze[row][col+1] == target - 1
          maze[row][col+1] = '*'
          col += 1
        end
        target -= 1

      end
      #REMOVE NUMBERS FROM MAZE:
      row = 0
      while row < maze.count
        col = 0
        while col < maze[row].count

          if maze[row][col].is_a?(Fixnum)
            maze[row][col] = ' '
          end
          col += 1
        end
        row += 1
      end

      puts
      puts "And here's the maze's solution:"
      puts
      print_maze(maze)


    when 7
      puts "Solving maze #7!"
      maze = read_maze(option_selected)

      puts
      puts "Here's the maze:"
      puts
      print_maze(maze)

      f_finder(maze)


      f_col = 0
      f_row = 0
      target = 0
      found_s = false

      while !found_s
        row = 0
        while row < maze.count
          col = 0
          while col < maze[row].count
            if maze[row][col] == target
              if maze[row-1][col] == ' '
                maze[row-1][col] = target + 1
              end
              if maze[row+1][col] == ' '
                maze[row+1][col] = target + 1
              end
              if maze[row][col-1] == ' '
                maze[row][col-1] = target + 1
              end
              if maze[row][col+1] == ' '
                maze[row][col+1] = target + 1
              end

              # Looking NSEW for an s and if found setting flag to true:
              if maze[row][col] == target
                if maze[row-1][col] == 'S'
                  found_s = true
                  s_row = row-1
                  s_col = col
                end
                if maze[row+1][col] == 'S'
                  found_s = true
                  s_row = row+1
                  s_col = col
                end
                if maze[row][col-1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col-1
                end
                if maze[row][col+1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col+1
                end
              end
            end
            col += 1
          end
          row += 1
        end
        target += 1
      end

      #BACKTRACKING:

      row = s_row
      col = s_col
      while target > 0

        if maze[row-1][col] == target - 1
          maze[row-1][col] = '*'
          row -= 1
        end

        if maze[row+1][col] == target - 1
          maze[row+1][col] = '*'
          row += 1
        end

        if maze[row][col-1] == target - 1
          maze[row][col-1] = '*'
          col -= 1
        end

        if maze[row][col+1] == target - 1
          maze[row][col+1] = '*'
          col += 1
        end
        target -= 1

      end
      #REMOVE NUMBERS FROM MAZE:
      row = 0
      while row < maze.count
        col = 0
        while col < maze[row].count

          if maze[row][col].is_a?(Fixnum)
            maze[row][col] = ' '
          end
          col += 1
        end
        row += 1
      end

      puts
      puts "And here's the maze's solution:"
      puts
      print_maze(maze)


    when 8
      puts "Solving maze #8!"
      maze = read_maze(option_selected)

      puts
      puts "Here's the maze:"
      puts
      print_maze(maze)

      f_finder(maze)


      f_col = 0
      f_row = 0
      target = 0
      found_s = false

      while !found_s
        row = 0
        while row < maze.count
          col = 0
          while col < maze[row].count
            if maze[row][col] == target
              if maze[row-1][col] == ' '
                maze[row-1][col] = target + 1
              end
              if maze[row+1][col] == ' '
                maze[row+1][col] = target + 1
              end
              if maze[row][col-1] == ' '
                maze[row][col-1] = target + 1
              end
              if maze[row][col+1] == ' '
                maze[row][col+1] = target + 1
              end

              # Looking NSEW for an s and if found setting flag to true:
              if maze[row][col] == target
                if maze[row-1][col] == 'S'
                  found_s = true
                  s_row = row-1
                  s_col = col
                end
                if maze[row+1][col] == 'S'
                  found_s = true
                  s_row = row+1
                  s_col = col
                end
                if maze[row][col-1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col-1
                end
                if maze[row][col+1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col+1
                end
              end
            end
            col += 1
          end
          row += 1
        end
        target += 1
      end

      #BACKTRACKING:

      row = s_row
      col = s_col
      while target > 0

        if maze[row-1][col] == target - 1
          maze[row-1][col] = '*'
          row -= 1
        end

        if maze[row+1][col] == target - 1
          maze[row+1][col] = '*'
          row += 1
        end

        if maze[row][col-1] == target - 1
          maze[row][col-1] = '*'
          col -= 1
        end

        if maze[row][col+1] == target - 1
          maze[row][col+1] = '*'
          col += 1
        end
        target -= 1

      end
      #REMOVE NUMBERS FROM MAZE:
      row = 0
      while row < maze.count
        col = 0
        while col < maze[row].count

          if maze[row][col].is_a?(Fixnum)
            maze[row][col] = ' '
          end
          col += 1
        end
        row += 1
      end

      puts
      puts "And here's the maze's solution:"
      puts
      print_maze(maze)


    when 9
      puts "Solving maze #9!"
      maze = read_maze(option_selected)

      puts
      puts "Here's the maze:"
      puts
      print_maze(maze)

      f_finder(maze)


      f_col = 0
      f_row = 0
      target = 0
      found_s = false

      while !found_s
        row = 0
        while row < maze.count
          col = 0
          while col < maze[row].count
            if maze[row][col] == target
              if maze[row-1][col] == ' '
                maze[row-1][col] = target + 1
              end
              if maze[row+1][col] == ' '
                maze[row+1][col] = target + 1
              end
              if maze[row][col-1] == ' '
                maze[row][col-1] = target + 1
              end
              if maze[row][col+1] == ' '
                maze[row][col+1] = target + 1
              end

              # Looking NSEW for an s and if found setting flag to true:
              if maze[row][col] == target
                if maze[row-1][col] == 'S'
                  found_s = true
                  s_row = row-1
                  s_col = col
                end
                if maze[row+1][col] == 'S'
                  found_s = true
                  s_row = row+1
                  s_col = col
                end
                if maze[row][col-1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col-1
                end
                if maze[row][col+1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col+1
                end
              end
            end
            col += 1
          end
          row += 1
        end
        target += 1
      end

      #BACKTRACKING:

      row = s_row
      col = s_col
      while target > 0

        if maze[row-1][col] == target - 1
          maze[row-1][col] = '*'
          row -= 1
        end

        if maze[row+1][col] == target - 1
          maze[row+1][col] = '*'
          row += 1
        end

        if maze[row][col-1] == target - 1
          maze[row][col-1] = '*'
          col -= 1
        end

        if maze[row][col+1] == target - 1
          maze[row][col+1] = '*'
          col += 1
        end
        target -= 1

      end
      #REMOVE NUMBERS FROM MAZE:
      row = 0
      while row < maze.count
        col = 0
        while col < maze[row].count

          if maze[row][col].is_a?(Fixnum)
            maze[row][col] = ' '
          end
          col += 1
        end
        row += 1
      end

      puts
      puts "And here's the maze's solution:"
      puts
      print_maze(maze)


    when 10
      puts "Solving maze #10!"
      maze = read_maze(option_selected)

      puts
      puts "Here's the maze:"
      puts
      print_maze(maze)

      f_finder(maze)


      f_col = 0
      f_row = 0
      target = 0
      found_s = false

      while !found_s
        row = 0
        while row < maze.count
          col = 0
          while col < maze[row].count
            if maze[row][col] == target
              if maze[row-1][col] == ' '
                maze[row-1][col] = target + 1
              end
              if maze[row+1][col] == ' '
                maze[row+1][col] = target + 1
              end
              if maze[row][col-1] == ' '
                maze[row][col-1] = target + 1
              end
              if maze[row][col+1] == ' '
                maze[row][col+1] = target + 1
              end

              # Looking NSEW for an s and if found setting flag to true:
              if maze[row][col] == target
                if maze[row-1][col] == 'S'
                  found_s = true
                  s_row = row-1
                  s_col = col
                end
                if maze[row+1][col] == 'S'
                  found_s = true
                  s_row = row+1
                  s_col = col
                end
                if maze[row][col-1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col-1
                end
                if maze[row][col+1] == 'S'
                  found_s = true
                  s_row = row
                  s_col = col+1
                end
              end
            end
            col += 1
          end
          row += 1
        end
        target += 1
      end

      #BACKTRACKING:

      row = s_row
      col = s_col
      while target > 0

        if maze[row-1][col] == target - 1
          maze[row-1][col] = '*'
          row -= 1
        end

        if maze[row+1][col] == target - 1
          maze[row+1][col] = '*'
          row += 1
        end

        if maze[row][col-1] == target - 1
          maze[row][col-1] = '*'
          col -= 1
        end

        if maze[row][col+1] == target - 1
          maze[row][col+1] = '*'
          col += 1
        end
        target -= 1

      end
      #REMOVE NUMBERS FROM MAZE:
      row = 0
      while row < maze.count
        col = 0
        while col < maze[row].count

          if maze[row][col].is_a?(Fixnum)
            maze[row][col] = ' '
          end
          col += 1
        end
        row += 1
      end

      puts
      puts "And here's the maze's solution:"
      puts
      print_maze(maze)

    when 11
      puts "Quitting the maze program."

    else
      puts "Please make a numeric selection from the menu (1 - 11):"
      puts
  end
end
