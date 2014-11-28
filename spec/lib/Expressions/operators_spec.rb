require './spec/spec_helper'

describe Operator do
  def returns(postfix, tree)
    expect(AbstractSyntaxTreeBuilder.new(postfix).build_tree).to be(tree)
  end

  it 'unary minus on int to SQL' do
    expect(UnaryMinus.new('180').to_sql).to be(-180)
  end

end