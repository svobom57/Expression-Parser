require './spec/spec_helper'

describe Operator do

  it 'unary minus on int to SQL' do
    expect(UnaryMinus.new('180').to_sql).to be(-180)
  end

  it 'unary minus on string to SQL' do
    expect{UnaryMinus.new('ahoj').to_sql}.to raise_error(ArgumentError)
  end

end