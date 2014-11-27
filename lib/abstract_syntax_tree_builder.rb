class AbstractSyntaxTreeBuilder

	def initialize(postfix)
		@postfix = postfix
	end

	def build_tree

		until @postfix.length == 1
			operator_index = @postfix.find_index { |token|
				begin
					Operator.factory!(token)
					true
				rescue
					false
				end
			}
			raise 'Not enough operators' if operator_index.nil?
			exp = Operator.factory!(@postfix.slice!(operator_index))
			most_left_child = operator_index - exp::ARITY
			raise "Not enough operands for operator #{exp}" if most_left_child < 0
			children = @postfix.slice!(most_left_child, exp::ARITY)
			@postfix.insert(most_left_child, exp.new(*children))
		end
		@postfix.first
	end

end