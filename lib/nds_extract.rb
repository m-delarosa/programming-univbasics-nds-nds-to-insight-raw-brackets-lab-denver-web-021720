$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'
require 'pp'
require 'pry'

NDS = directors_database
pp NDS
# binding.pry

def directors_totals(nds)
  # Remember, it's always OK to pretty print what you get *in* to make sure
  # that you know what you're starting with!
  #
  #
  # The Hash result be full of things like "Jean-Pierre Jeunet" => "222312123123"
  result = {}
  #dir_index refers to each directors hash in the top level array. Will use to iterate through each array element "Directors"
  dir_index = 0

  #setting up while loop to execute for each director element in the top level array.
  while dir_index < nds.length do
    #declaring a variabe which will store the director's name for each director element. This will be a string.
    dir_name = nds[dir_index][:name]
    #sets the value of the first element within hash to a string of the director's name and sets it to 0
    result[dir_name] = 0
    #will use this to iterate through the elements in the :movie hash
    mov_index = 0

    while mov_index < nds[dir_index][:movies].length do
    #while loop that will iterate through the :movies hash elements
      result[dir_name] += nds[dir_index][:movies][mov_index][:worldwide_gross]
      #Adds :worldwide_gross integer as value for the corresponding developer name string ie: {"Spielberg" => 872387}
      mov_index += 1
      #Sets the iteration counter up by one to further scan through :movies hash.
    end

    dir_index += 1
    #Increases the director element counter by one and starts over up top to obtain :name and :worldwide_gross
  end

  result
  #implicitly returns the value of the result hash to this method
end
