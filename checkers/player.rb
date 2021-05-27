class Player
  attr_accessor :checkers
  attr_reader :name

  def initialize(name, checkers)
    @name = name
    @checkers = checkers
  end
end
