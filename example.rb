require 'pry'
# require 'pp'

vm = [[[{:name=>"Vanilla Cookies", :price=>3}, {:name=>"Pistachio Cookies", :price=>3}, {:name=>"Chocolate Cookies", :price=>3}, {:name=>"Chocolate Chip Cookies", :price=>3}], [{:name=>"Tooth-Melters", :price=>12}, {:name=>"Tooth-Destroyers", :price=>12}, {:name=>"Enamel Eaters", :price=>12}, {:name=>"Dentist's Nightmare", :price=>20}], [{:name=>"Gummy Sour Apple", :price=>3}, {:name=>"Gummy Apple", :price=>5}, {:name=>"Gummy Moldy Apple", :price=>1}]], [[{:name=>"Grape Drink", :price=>1}, {:name=>"Orange Drink", :price=>1}, {:name=>"Pineapple Drink", :price=>1}], [{:name=>"Mints", :price=>13}, {:name=>"Curiously Toxic Mints", :price=>1000}, {:name=>"US Mints", :price=>99}]]]

# pp vm

# [[[{:name=>"Vanilla Cookies", :price=>3},
#   {:name=>"Pistachio Cookies", :price=>3},
#   {:name=>"Chocolate Cookies", :price=>3},
#   {:name=>"Chocolate Chip Cookies", :price=>3}],
#   [{:name=>"Tooth-Melters", :price=>12},
#   {:name=>"Tooth-Destroyers", :price=>12},
#   {:name=>"Enamel Eaters", :price=>12},
#   {:name=>"Dentist's Nightmare", :price=>20}],
#   [{:name=>"Gummy Sour Apple", :price=>3},
#   {:name=>"Gummy Apple", :price=>5},
#   {:name=>"Gummy Moldy Apple", :price=>1}]],
# [[{:name=>"Grape Drink", :price=>1},
#   {:name=>"Orange Drink", :price=>1},
#   {:name=>"Pineapple Drink", :price=>1}],
#   [{:name=>"Mints", :price=>13},
#   {:name=>"Curiously Toxic Mints", :price=>1000},
#   {:name=>"US Mints", :price=>99}]]]

def explore_nds(vm)
   row_index = 0
while row_index < vm.length do
  puts "Row #{row_index} has #{vm[row_index]} columns"

  column_index = 0
  while column_index < vm[row_index].length do
    coord = "#{row_index}, #{column_index}"
    inner_len = vm[row_index][column_index].length
    # Remember \t is a TAB character for indentation
    puts "\tCoordinate [#{coord}] points to an #{vm[row_index][column_index].class} of length #{inner_len}"

    inner_index = 0
    while inner_index < inner_len do
      puts "\t\t (#{coord}, #{inner_len}) is: #{vm[row_index][column_index][inner_index]}"
      inner_index += 1
    end

    column_index += 1
  end

  row_index += 1
end
end

# explore_nds(vm)

#=>
# Row 0 has [[{:name=>"Vanilla Cookies", :price=>3}, {:name=>"Pistachio Cookies",:price=>3}, {:name=>"Chocolate Cookies", :price=>3}, {:name=>"Chocolate Chip Cookies", :price=>3}], [{:name=>"Tooth-Melters", :price=>12}, {:name=>"Tooth-Destroyers", :price=>12}, {:name=>"Enamel Eaters", :price=>12}, {:name=>"Dentist's Nightmare", :price=>20}], [{:name=>"Gummy Sour Apple", :price=>3}, {:name=>"Gummy Apple", :price=>5}, {:name=>"Gummy Moldy Apple", :price=>1}]] columns
#         Coordinate [0, 0] points to an Array of length 4
#                 (0, 0, 4) is: {:name=>"Vanilla Cookies", :price=>3}
#                 (0, 0, 4) is: {:name=>"Pistachio Cookies", :price=>3}
#                 (0, 0, 4) is: {:name=>"Chocolate Cookies", :price=>3}
#                 (0, 0, 4) is: {:name=>"Chocolate Chip Cookies", :price=>3}
#         Coordinate [0, 1] points to an Array of length 4
#                 (0, 1, 4) is: {:name=>"Tooth-Melters", :price=>12}
#                 (0, 1, 4) is: {:name=>"Tooth-Destroyers", :price=>12}
#                 (0, 1, 4) is: {:name=>"Enamel Eaters", :price=>12}
#                 (0, 1, 4) is: {:name=>"Dentist's Nightmare", :price=>20}
#         Coordinate [0, 2] points to an Array of length 3
#                 (0, 2, 3) is: {:name=>"Gummy Sour Apple", :price=>3}
#                 (0, 2, 3) is: {:name=>"Gummy Apple", :price=>5}
#                 (0, 2, 3) is: {:name=>"Gummy Moldy Apple", :price=>1}
# Row 1 has [[{:name=>"Grape Drink", :price=>1}, {:name=>"Orange Drink", :price=>1}, {:name=>"Pineapple Drink", :price=>1}], [{:name=>"Mints", :price=>13}, {:name=>"Curiously Toxic Mints", :price=>1000}, {:name=>"US Mints", :price=>99}]] columns
#         Coordinate [1, 0] points to an Array of length 3
#                 (1, 0, 3) is: {:name=>"Grape Drink", :price=>1}
#                 (1, 0, 3) is: {:name=>"Orange Drink", :price=>1}
#                 (1, 0, 3) is: {:name=>"Pineapple Drink", :price=>1}
#         Coordinate [1, 1] points to an Array of length 3
#                 (1, 1, 3) is: {:name=>"Mints", :price=>13}
#                 (1, 1, 3) is: {:name=>"Curiously Toxic Mints", :price=>1000}
#                 (1, 1, 3) is: {:name=>"US Mints", :price=>99}

def find_grand_total_price(vm)
  grand_total = 0
  row_index = 0
  while row_index < vm.length do
    column_index = 0
    while column_index < vm[row_index].length do
      inner_len = vm[row_index][column_index].length
      inner_index = 0
      while inner_index < inner_len do
        # Explanation!
        # vm[row][column][spinner]
        # spinner is full of Hashes with keys :price and :name
        grand_total += vm[row_index][column_index][inner_index][:price]
        inner_index += 1
      end
      column_index += 1
    end
    row_index += 1
  end
  p grand_total
end

find_grand_total_price(vm)
