class Arity2Operators < Operator

  attr_reader :left, :right
  ARITY = 2

  def initialize(left, right)
    @left = left
    @right = right
  end

  def ==(other)
    other.class == self.class && other.left == @left && other.right == @right
  end

  alias_method :equal?, :==

end
