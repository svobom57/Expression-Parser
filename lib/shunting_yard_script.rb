LONGEST_OP_LENGTH = 2
OPERAND = 0
OPERATOR = 1
LEFT_BRACKET = 2
RIGHT_BRACKET = 3
# Operators and their precedence. The higher the number the lower the priority
operators = {
		:'-' => 3, # unary minus
		:'>' => 8,
		:'>=' => 8,
		:'<' => 8,
		:'<=' => 8,
		:'=' => 9,
		:'&&' => 13,
		:'||' => 14,
}.freeze
#expression = ' material = drevo && ( cena>= 180 || cena <= 250) '.strip.gsub(/[ ]/, '')
#expression = ' ()((cena = -150))()'.strip.gsub(/[ ]/, '')
expression = '-A = 150 || B && C'.strip.gsub(/[ ]/, '')
#expression = '(A || -B) && C'.strip.gsub(/[ ]/, '')
input = []
start = 0
i = 0
add_operand = false
# Parse the expression
while i <= expression.length - 1
	# Start of an operator
	if  expression[i] !~ /[a-zA-Z]/ && expression[i] !~ /\d/
		# There might be the situation where operator is followed by bracket, in that case we don't want to add operand
		if add_operand
			operand = expression[start, i-start] #+1 included in "i"
			input << operand
			add_operand = false
		end
		start = i+1
		# Checking whether there is a longer operator coming
		# Correctly this should be done by iteration from LONGEST_OP_LENGTH.downto(1)
		if operators.has_key?(expression[i, LONGEST_OP_LENGTH].intern)
			operator = expression[i, LONGEST_OP_LENGTH]
			input << operator
			i += 1
			start += 1
			# This is either single char operator or left or right bracket
		else
			operator = expression[i]
			if operator == '('
				input << operator
			elsif operator == ')'
				input << operator
			else
				raise("Unknown operator: #{operator}") unless operators.has_key?(operator.intern)
				input << operator
			end
		end
		# expression ends with operand
	elsif expression.length - 1 == i
		operand = expression[start, i-start+1]
		input << operand
	else
		add_operand = true
	end
	i += 1
end
# Performs Shunting-yard algorithm
output = []
stack = []
bracket_sum = 0
input.each do |token|
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
			if operators.has_key?(token.intern)
				loop do
					length = stack.length
					if length == 0 || stack[length-1] == '('
						stack << token
						break
					end
					# Token has higher priority than top of stack
					if operators[token.intern] < operators[stack[length-1].intern]
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
p output