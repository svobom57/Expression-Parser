class AbstractSyntaxTreeBuilder

	EXPRESSIONS = {
			'=' => Equal,
			'>' => GreaterThan,
			'<' => LessThan,
			'>=' => GreaterThanEqual,
			'<=' => LessThanEqual,
			'&&' => And,
			'||' => Or,
			'-' => UnaryMinus
	}.freeze
	private_constant :EXPRESSIONS

	def initialize(postfix)
		@postfix = postfix
	end

	def build_tree

		until @postfix.length == 1
			operator_index = @postfix.find_index { |token| EXPRESSIONS.key?(token) }
			raise 'Not enough operators' if operator_index.nil?
			exp = EXPRESSIONS[@postfix.slice!(operator_index)]
			most_left_child = operator_index - exp::ARITY
			raise "Not enough operands for operator #{exp}" if most_left_child < 0
			children = @postfix.slice!(most_left_child, exp::ARITY)
			@postfix.insert(most_left_child, exp.new(*children))
		end
		@postfix.first
	end

end