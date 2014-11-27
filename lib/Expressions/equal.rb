class Equal < Arity2Operators
	Operator.register('=', Equal, 9)
	attr_reader :left, :right

end