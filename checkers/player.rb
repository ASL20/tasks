class Player
  attr_accessor :checkers, :checkers_number
  attr_reader :name

  def initialize(name, checkers)
    @name = name
    @checkers = checkers
    @checkers_number = checkers.size
  end
end
