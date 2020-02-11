require 'pry'

person_array = [ 
  {name: "Tashawn", interests: ["sports", "tv"]},
  {name: "Laura", interests: ["skiing", "books"]},
  {name: "Evans", interests: ["sports", "camping"]} 
  ]
  
  def say_hi(array)
    array.map do |person|
     binding.pry 
      "Hello #{person[:name]}!"
    end
  end
  
  say_hi(person_array)

#run the file, it will stop withing the do method, examine person parameter value, see that ["name"] is nil, should pass through [:name] instead.