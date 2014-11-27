module Arity2Operators

	ARITY = 2

	def initialize(left, right)
		@left = left
		@right = right
	end

	def ==(object)
		object.class == self.class && object.left == @left && object.right == @right
	end

	alias :equal? :==

end