class UnaryMinus < Arity1Operators
	Operator.register('-', UnaryMinus, 3)
	attr_reader :operand
end