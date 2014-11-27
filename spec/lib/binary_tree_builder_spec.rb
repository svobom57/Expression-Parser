require './spec/spec_helper'

describe BinaryTreeBuilder do
	def returns(postfix, tree)
		expect(ShuntingYard.new(tokens).build_tree).to eq(tree)
	end
end
