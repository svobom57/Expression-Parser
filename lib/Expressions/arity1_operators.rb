class Arity1Operators < Operator

	ARITY = 1

	def ==(object)
		object.class == self.class && object.operand == @operand
	end

	def initialize(operand)
		@operand = operand
	end

	alias :equal? :==

end