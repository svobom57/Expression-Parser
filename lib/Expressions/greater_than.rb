class GreaterThan < Arity2Operators
	Operator.register('>', GreaterThan, 8)
	attr_reader :left, :right

end