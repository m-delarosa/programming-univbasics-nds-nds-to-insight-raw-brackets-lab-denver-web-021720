$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'
require 'pp'
require 'pry'

NDS = directors_database
pp NDS
binding.pry

def directors_totals(nds)
  # Remember, it's always OK to pretty print what you get *in* to make sure
  # that you know what you're starting with!
  #
  #
  # The Hash result be full of things like "Jean-Pierre Jeunet" => "222312123123"
  result = {}
  #dir_index refers to each directors hash in the top level array.
  dir_index = 0

  #setting while loop to execute for each director element in the top level array.
  while dir_index < nds.length do
    #declaring a variabe which will store the director's name for each director element. This will be a string.
    dir_name = nds[dir_index][:name]
    #
    binding.pry
    result[dir_name] = 0
    mov_index = 0

    while mov_index < nds[dir_index][:movies].length do
      result[dir_name] += nds[dir_index][:movies][mov_index][:worldwide_gross]
      mov_index += 1
    end

    dir_index += 1
  end

  result
end
