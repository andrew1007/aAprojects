class Friend
  # TODO: your code goes here!
#  attr_accessor :name
  def greeting(name = "!")
    unless name == "!" then name = ", #{name}!" end
    "Hello" << name
  end
end
