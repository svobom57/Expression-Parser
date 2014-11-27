class Or < Arity2Operators
	Operator.register('||', Or, 14)
	attr_reader :left, :right

end