require './spec/spec_helper'

describe BinaryTreeBuilder do
	def returns(tokens, postfix)
		expect(ShuntingYard.new(tokens).postfix).to eq(postfix)
	end
end
