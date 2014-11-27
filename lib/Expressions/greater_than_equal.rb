class GreaterThanEqual < Arity2Operators
	Operator.register('>=', GreaterThanEqual, 8)
	attr_reader :left, :right
end