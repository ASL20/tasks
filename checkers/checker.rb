class Checker
  attr_accessor :owner
  attr_reader :color

  def initialize(owner, color)
    @owner = owner
    @color = color
  end
end
