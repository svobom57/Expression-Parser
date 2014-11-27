class And < Arity2Operators
	Operator.register('&&', And, 13)
	attr_reader :left, :right

end