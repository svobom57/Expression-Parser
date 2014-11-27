class LessThanEqual < Arity2Operators
	Operator.register('<=', LessThanEqual, 8)
	attr_reader :left, :right
end