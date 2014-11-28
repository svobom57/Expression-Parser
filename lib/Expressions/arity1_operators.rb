class Arity1Operators < Operator

  attr_reader :operand
  ARITY = 1

  def ==(object)
    object.class == self.class && object.operand == @operand
  end

  def initialize(operand)
    @operand = operand
  end

  alias :equal? :==

  def to_sql
    if self.class == UnaryMinus
      -operand.to_i
    end
  end
end