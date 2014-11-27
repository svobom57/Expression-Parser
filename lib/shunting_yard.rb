class ShuntingYard

	:tokens

	OPERATORS = {
			:'-' => 3, # unary minus
			:'>' => 8,
			:'>=' => 8,
			:'<' => 8,
			:'<=' => 8,
			:'=' => 9,
			:'&&' => 13,
			:'||' => 14,
	}.freeze
	private_constant :OPERATORS


	def initialize(tokens)
		raise ArgumentError.new("Expected array: Got #{tokens.class}") unless tokens.is_a?(Array)
		@tokens = tokens
	end

	def postfix
		# Performs Shunting-yard algorithm
		output = []
		stack = []
		bracket_sum = 0
		@tokens.each do |token|
			case token
				when '('
					stack << token
					bracket_sum += 1
				when ')'
					bracket_sum -= 1
					raise('Right parentheses mismatch') if  bracket_sum < 0
					while stack.length > 0
						pop = stack.pop
						if pop == '('
							break
						end
						output << pop
					end
				else
					if OPERATORS.key?(token.intern)
						loop do
							length = stack.length
							if length == 0 || stack[length-1] == '('
								stack << token
								break
							end
							# Token has higher priority than top of stack
							if OPERATORS[token.intern] < OPERATORS[stack[length-1].intern]
								stack << token
								break
							else
								output << stack.pop
							end
						end
					else
						output << token
					end
			end
		end
		raise('Left parentheses mismatch') if bracket_sum > 0
		stack.length.times do
			output << stack.pop
		end
		output
	end

end