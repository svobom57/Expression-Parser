class Arity1Operators < Operator

  attr_reader :operand
  ARITY = 1

  def ==(other)
    other.class == self.class && other.operand == @operand
  end

  def initialize(operand)
    @operand = operand
  end

  alias_method :equal?, :==

  def to_sql
    if self.is_a? UnaryMinus
      operand = @operand
      fail(ArgumentError, ("#{operand} is not a number")) if operand !~ /^\d+$/
      -operand.to_i
    end
  end
end
