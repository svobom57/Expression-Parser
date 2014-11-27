class NotEqual < Arity2Operators
	Operator.register('!=', NotEqual, 9)
	attr_reader :left, :right

end