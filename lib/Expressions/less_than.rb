class LessThan < Arity2Operators
	Operator.register('<', LessThan, 8)
	attr_reader :left, :right

end